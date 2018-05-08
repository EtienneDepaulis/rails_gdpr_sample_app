class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:email, :password, :password_confirmation, :policy_rule_age, :policy_rule_privacy_terms)
      end
    end

    def after_sign_in_path_for(user)
      handle_cookie_policy_for(user) if cookies["cookieconsent_status"] == "dismiss"

      super(user)
    end

    def handle_cookie_policy_for(user)
      rule_name = "cookie"

      return if !user.needs_policy_confirmation_for?(rule_name)

      term = user.policy_term_on(rule_name)
      user.handle_policy_for(term).accept!
    end

end
