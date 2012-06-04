# -*- encoding : utf-8 -*-
module Authentication
	class Session
		include DataMapper::Resource

		#
		def self.default_repository_name
			:in_memory
		end

		# properties
		property(:id, Serial)

		# associations
		belongs_to(:user, Authentication::User)

		# class methods
		#
		def self.create_by(credentials)
			new(:user => User.first_by_credentials(credentials))
		end
	end
end
