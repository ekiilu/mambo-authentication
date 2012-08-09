#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
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
