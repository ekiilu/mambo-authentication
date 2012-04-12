module Authentication
	class AuthenticatedController < BaseController
		before_filter(:requires_authentication)

		#
		def requires_authentication
			logger.debug(authenticated_user)
			if authenticated_user.nil?
				session[:back] = request.url
				logger.debug(session[:back])
				logger.debug(authentication.new_session_path)
				redirect_to(authentication.new_session_path)
			end
		end
	end
end
