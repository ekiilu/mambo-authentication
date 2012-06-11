# -*- encoding : utf-8 -*-
module Authentication
	class UserRole < ActiveRecord::Base
		# associations
		belongs_to(:user)
		belongs_to(:role)
	end
end
