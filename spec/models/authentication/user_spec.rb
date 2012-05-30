require "spec_helper"

describe Authentication::User do
	#
	it "creates user" do
		params = attributes_for(:user)

		user = Authentication::User.create(params)

		user.should be_valid
	end

	#
	it "first first user by credentials" do
		create(:user)

		credentials = build(:credentials)

		user = Authentication::User.first_by_credentials(credentials)

		user.should_not be_nil
	end
end
