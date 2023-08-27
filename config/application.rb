require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    # ...

    # Configure Devise permitted parameters
    config.to_prepare do
      DeviseController.respond_to :html, :json

      DeviseController.class_eval do
        before_action :configure_permitted_parameters, if: :devise_controller?

        protected

        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
        end
      end
    end
  end
end
