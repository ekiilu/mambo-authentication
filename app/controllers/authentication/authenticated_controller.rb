module Authentication
	class AuthenticatedController < BaseController
		before_filter(:requires_authentication)

		#
		def requires_authentication
			if authenticated_user.nil?
				session[:back] = request.url
				redirect_to(main_app.root_path)
			end
		end
	end
end
