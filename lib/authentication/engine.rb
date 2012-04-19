module Authentication
  class Engine < Rails::Engine
    isolate_namespace Authentication

		#
    initializer "models" do
    	require "authentication/user"
    	require "authentication/credentials"
    	require "authentication/session"
		end

		#
    initializer "i18n" do
    	I18n.load_path += Dir[File.join(__FILE__, "config", "locales", "**", "*.{rb,yml}")]
    end
  end
end
