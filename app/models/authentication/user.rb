#-  -*- encoding : utf-8 -*- 
#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

module Authentication
	class User < ActiveRecord::Base
    # attributes
    attr_accessible(:system, :name, :email_address, :phone_number, :password, :password_confirmation)
    attr_reader(:password)

		# validations
    validates(:name, :uniqueness => true, :length => {:in => 2..64}, :format => /^[\w_]*$/)
    validates(:email_address, :uniqueness => true, :length => {:maximum => 128}, :format => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i)
    validates(:phone_number, :length => {:is => 10}, :format => /^\d*$/, :allow_blank => true)
		validates(:password, :length => {:in => 6..32}, :format => /^\w*$/, :confirmation => true, :allow_blank => true)

		# associations
		has_many(:user_roles, :dependent => :destroy)
		has_many(:roles, :through => :user_roles)

		# nested
		accepts_nested_attributes_for(:user_roles)

		def password=(password)
			return if password.blank?
			@password = password
			self.password_digest = User.digest(password)
		end

		# instance methods
		def has_role(role)
			roles.exists?(:name => role.to_s)
		end

		# class methods
		#
		def self.with_phone_number
			where{(phone_number != nil) & (phone_number != '')}
		end

		# get by credentials
		def self.first_by_credentials(credentials)
			where(
				:email_address => credentials.email_address,
				:password_digest => digest(credentials.password)
			).first
		end

		#
		def self.digest(value)
			Digest::SHA1.hexdigest(value)
		end
	end
end
