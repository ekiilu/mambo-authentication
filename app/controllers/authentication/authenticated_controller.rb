module Authentication
	class AuthenticatedController < BaseController
		before_filter(:requires_authentication)

		#
		def requires_authentication
			if authenticated_user.nil?
				session[:back] = request.url
				redirect_to(new_session_path)
			end
		end
	end
end
