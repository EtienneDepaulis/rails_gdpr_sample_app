# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )


config = PolicyManager::Config.setup do |c|
  c.logout_url = "logout"
  c.from_email = "admin@acme.com"
  c.admin_email_inbox = "foo@baaz.org"
  # is_admin method in order for engine to know
  # how to authorize admin only areas
  c.is_admin_method = ->(o){
    true
  }

  c.add_rule({name: "cookie", sessionless: true }  )
  c.add_rule({name: "age", validates_on: [:create, :update], blocking: true })
  c.add_rule({name: "privacy_terms", validates_on: [:create, :update], blocking: true })
end

PolicyManager::UserTermsController.send(:include, Devise::Controllers::Helpers)