module Authentication
	class Session
		include DataMapper::Resource

		#
		def self.default_repository_name
			:in_memory
		end

		# associations
		belongs_to(:user, :key => true)

		# class methods
		#
		def self.create_by(credentials)
			session = Session.new
			session.user = User.get_by_credentials(credentials)
			session
		end
	end
end
