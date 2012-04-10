module Authentication
	class AuthenticatedController < ActionController::Base
		before_filter(:requires_authentication)

		#
		def requires_authentication
			if authenticated_user.nil?
				session[:back] = request.url
				redirect_to(main_app.root_path)
			end
		end

	protected

		#
		def authenticated_user
			if @authenticated_user.nil?
				@authenticated_user = User.get(session[:user_id])
			end
			@authenticated_user
		end
	end
end
