module Authentication
	class BaseController < ActionController::Base
		include AuthenticatedUser
		helper_method(:authenticated_user)
		layout("authentication")
	end
end
