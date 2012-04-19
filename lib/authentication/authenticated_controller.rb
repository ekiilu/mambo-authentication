require "authentication/authenticated_user"

module Authentication
	module AuthenticatedController
		#
		def self.included(base)
			base.class_eval do
				include AuthenticatedUser
				before_filter(:requires_authentication)
			end
		end

		#
		def requires_authentication
			if authenticated_user.nil?
				session[:back] = request.url
				redirect_to(authentication.new_session_path)
			end
		end
	end
end
