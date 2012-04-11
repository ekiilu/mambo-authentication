module Authentication
	module AuthenticatedUser
		#
		def authenticated_user
			if @authenticated_user.nil?
				@authenticated_user = User.get(session[:user_id])
			end
			@authenticated_user
		end
	end
end
