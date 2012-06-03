# -*- encoding : utf-8 -*-
module Authentication
	class Role
		include DataMapper::Resource

		# properties
		property(:id, Serial)
		property(:system, Boolean, {:required => true, :default => false})
		property(:name, String, {:unique => true, :length => 64})
		property(:desc, String, {:unique => true, :required => true, :length => 64})
		property(:created_at, DateTime)
		property(:updated_at, DateTime)

		# validations
		validates_format_of(:name, :with => /^[\w_]*$/)
		validates_length_of(:name, :in => 2..64)

		validates_format_of(:desc, :with => /^[\w ]*$/)
		validates_length_of(:desc, :in => 2..64)

		# associations
		has(n, :user_roles, Authentication::UserRole, :constraint => :destroy)
		has(n, :users, Authentication::User, :through => :user_roles)

		# class methods
		# create new role
		def self.create_by(params)
			create(params)
		end

		# update role
		def self.update_by_id(id, params)
			role = get!(id)
			role.attributes = params
			role.save
			role
		end

		# destroy role
		def self.destroy_by_id(id)
			role = get!(id)
			role.destroy
			role
		end
	end
end
