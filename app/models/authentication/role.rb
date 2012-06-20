# -*- encoding : utf-8 -*-
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
		#
		def self.sorted_by(key, order)
			all(:order => [key.send(order)])
		end

		# create new role
		def self.create_by(params)
			create(params)
		end

		# update role
		def self.update_by_id(id, params)
			role = get!(id)
      role.update(params)
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
