# -*- encoding : utf-8 -*-
module Authentication
  class Engine < Rails::Engine
    isolate_namespace Authentication

    config.before_initialize do
    	puts "BEFORE INIT"
	    require "authentication/credentials"
	    require "authentication/session"
      require "authentication/user"
      require "authentication/role"
      require "authentication/user_role"
      puts "AFTER INIT"
    end

		#
    initializer "i18n" do
    	I18n.load_path += Dir[File.join(__FILE__, "config", "locales", "**", "*.{rb,yml}")]
    end
  end
end
