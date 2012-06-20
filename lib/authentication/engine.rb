# -*- encoding : utf-8 -*-
module Authentication
  class Engine < Rails::Engine
    isolate_namespace Authentication

		#
    initializer "models" do
		end

		#
    initializer "i18n" do
    	I18n.load_path += Dir[File.join(__FILE__, "config", "locales", "**", "*.{rb,yml}")]
    end
  end
end
