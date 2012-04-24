module Authentication
	class UserRole
		include DataMapper::Resource

		# properties
		property(:id, Serial)

		# associations
		belongs_to(:user, "Authentication::User",)
		belongs_to(:role, "Authentication::Role",)
	end
end
