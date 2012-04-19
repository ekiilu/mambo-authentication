module Authentication
	class Credentials
		include DataMapper::Resource

		#
		def self.default_repository_name
			:in_memory
		end

		# properties
		property(:email_address, String, {:key => true, :required => true, :length => 128})
		property(:password, String, :length => 32)

		# validations
		validates_length_of(:email_address, :max => 128)
		validates_format_of(:email_address, :as => :email_address)

		validates_length_of(:password, :within => 6..32)
		validates_format_of(:password, :with => /^\w*$/)
	end
end
