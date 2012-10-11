#-  -*- encoding : utf-8 -*- 
#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
require "spec_helper"

describe Authentication::User do
	#
	describe "validations" do
		subject { create(:user) }
		it { should validate_uniqueness_of(:name) }
		it { should validate_uniqueness_of(:email_address) }
	end

	#
	describe "associations" do
		subject { create(:user) }
		it { should have_many(:user_roles).dependent(:destroy) }
		it { should have_many(:roles).through(:user_roles) }
	end

	#
	describe "methods" do
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
			credentials = build(:credentials, :password => "bad")
			user = Authentication::User::first_by_credentials(credentials)
			user.should be_nil
			credentials = build(:credentials, :email_address => "bad@bad.bad")
			user = Authentication::User::first_by_credentials(credentials)
			user.should be_nil
		end

		#
		it "sorts by" do
			Authentication::User.sorted_by(:name, :asc)
		end

		#
		it "filters by phone number" do
			phone_number = "2222222222"
			user = create(:user, :phone_number => phone_number)
			Authentication::User.with_phone_number
		end
	end
end
