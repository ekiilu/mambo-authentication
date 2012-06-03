# -*- encoding : utf-8 -*-
module Authentication
	class User
		include DataMapper::Resource

		# properties
		property(:id, Serial)
		property(:system, Boolean, {:required => true, :default => false})
		property(:name, String, {:unique => true, :required => true, :length => 64})
		property(:email_address, String, {:unique => true, :required => true})
		property(:phone_number, String, {:unique => true, :length => 10})
		property(:password_digest, String)
		property(:created_at, DateTime)
		property(:updated_at, DateTime)

		# validations
		validates_format_of(:name, :with => /^[\w ]*$/)
		validates_length_of(:name, :in => 3..64)

		validates_format_of(:email_address, :as => :email_address)
		validates_length_of(:email_address, :max => 128)

		validates_length_of(:phone_number, :is => 10, :allow_blank => true)
		validates_format_of(:phone_number, :with => /^\d*$/, :allow_blank => true)

		validates_format_of(:password, {:with => /^\w*$/, :allow_blank => true})
		validates_length_of(:password, {:in => 6..32, :allow_blank => true})
		validates_confirmation_of(:password, {:confirm => :password_confirmation, :allow_blank => true})

		# associations
		has(n, :user_roles, Authentication::UserRole, :constraint => :destroy)
		has(n, :roles, Authentication::Role, :through => :user_roles)

		# nested
		accepts_nested_attributes_for(:user_roles)

		# attributes
		attr_accessor(:password_confirmation)
		attr_reader(:password)

		def password=(password)
			return if password.nil?
			@password = password
			self.password_digest = User.digest(password)
		end

		# instance methods
		def has_role(role)
			roles.first(:name => role.to_s) != nil
		end

		# class methods
		#
		def self.with_phone_number
			all(:phone_number.not => nil)
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
			user = User.get!(id)
			user.attributes = params
			user.save
			user
		end

		# destroy user
		def self.destroy_by_id(id)
			user = User.get!(id)
			user.destroy
			user
		end

		#
		def self.digest(value)
			Digest::SHA1.hexdigest(value)
		end
	end
end
