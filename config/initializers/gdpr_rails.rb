PolicyManager::Config.setup do |c|
  c.logout_url = "logout"
  c.from_email = "admin@acme.com"
  c.admin_email_inbox = "foo@baaz.org"

  c.current_admin_user_method = ->(controller) {
    controller.current_admin_user
  }
  c.is_admin_method = ->(o){
    o.is_a? AdminUser
  }

  c.add_rule({name: "cookie", sessionless: true }  )
  c.add_rule({name: "age", validates_on: [:create, :update], blocking: true })
  c.add_rule({name: "privacy_terms", validates_on: [:create, :update], blocking: true })

  c.exporter = {
    path: Rails.root + "tmp/export",
    resource: User
  }

  c.add_portability_rule({
    name: "exportable_data",
    collection: :articles,
    template: "hello, a collection will be rendered here use @collection.to_json",
    per: 10
  })

end

PolicyManager::UserTermsController.send(:include, Devise::Controllers::Helpers)