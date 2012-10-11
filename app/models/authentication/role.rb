#-  -*- encoding : utf-8 -*- 
#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

module Authentication
	class Role < ActiveRecord::Base
    # attributes
    attr_accessible(:system, :name, :desc)

		# validations
    validates(:name, :uniqueness => true, :length => {:in => 2..64}, :format => /^[\w_]*$/)
		validates(:desc, :length => {:in => 2..64}, :format => /^[\w ]*$/)

		# associations
		has_many(:user_roles, :dependent => :destroy)
		has_many(:users, :through => :user_roles)

		# class methods
	end
end
