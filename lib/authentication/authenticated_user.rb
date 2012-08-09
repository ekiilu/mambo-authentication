#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
module Authentication
	module AuthenticatedUser
		#
		def self.included(base)
			base.class_eval do
				helper_method(:authenticated_user)
			end
		end

		#
		def authenticated_user
			if @authenticated_user.nil? && session[:user_id]
				@authenticated_user = User.find(session[:user_id])
			end
			@authenticated_user
		end
	end
end
