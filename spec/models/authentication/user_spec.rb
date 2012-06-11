# -*- encoding : utf-8 -*-
require "spec_helper"

describe Authentication::User do
	#
	it "creates a valid user" do
		params = attributes_for(:user)

		user = Authentication::User.create(params)

		user.should be_valid
	end

	#
	it "finds a user with good credentials" do
		create(:user)

		credentials = build(:credentials)

		user = Authentication::User.first_by_credentials(credentials)

		user.should_not be_nil
	end

  #
  it "doesn't find a user with bad credentials" do
    create(:user)

    credentials = create(:credentials, :password => "bad")

    user = Authentication::User::first_by_credentials(credentials)

    user.should be_nil

    credentials = create(:credentials, :email_address => "bad@bad.bad")

    user = Authentication::User::first_by_credentials(credentials)

    user.should be_nil
  end
end
