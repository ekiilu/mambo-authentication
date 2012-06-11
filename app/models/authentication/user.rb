# -*- encoding : utf-8 -*-
module Authentication
	class User < ActiveRecord::Base
    # attributes
    attr_accessor(:system, :name, :email_address, :phone_number, :password, :password_confirmation)
    attr_reader(:password)

		#property(:id, Serial)
		#property(:system, Boolean, {:required => true, :default => false})
		#property(:name, String, {:unique => true, :required => true, :length => 64})
		#property(:email_address, String, {:unique => true, :required => true})
		#property(:phone_number, String, {:unique => true, :length => 10})
		#property(:password_digest, String)
		#property(:created_at, DateTime)
		#property(:updated_at, DateTime)

		# validations
    validates(:name, :uniqueness => true, :length => {:in => 2..64}, :format => /^[\w ]*$/)
    validates(:email_address, :uniqueness => true, :length => {:maximum => 128}, :format => //)
    validates(:phone_number, :length => {:is => 10}, :format => /^\d*$/, :allow_blank => true)
		validates(:password, :length => {:in => 6..32}, :format => /^\w*$/, :confirmation => true)

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
			roles.first(:name => role.to_s) != nil
		end

		# class methods
		#
		def self.sorted_by(key, order)
			all(:order => [key.send(order)])
		end

		#
		def self.with_phone_number
			all(:phone_number.not => nil) & all(:phone_number.not => "")
		end

		# get by credentials
		def self.first_by_credentials(credentials)
			first(
				:email_address => credentials.email_address,
				:password_digest => digest(credentials.password)
			)
		end

		# create new user
		def self.create_by(params)
			create(params)
		end

		# update user
		def self.update_by_id(id, params)
			user = get!(id)
			user.update(params)
			user
		end

		# destroy user
		def self.destroy_by_id(id)
			user = get!(id)
			user.destroy
			user
		end

		#
		def self.digest(value)
			Digest::SHA1.hexdigest(value)
		end
	end
end
