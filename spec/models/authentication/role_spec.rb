#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
require "spec_helper"

describe Authentication::Role do
	#
	describe "validations" do
		subject { create(:role) }
		it { should validate_uniqueness_of(:name) }
	end

	#
	describe "associations" do
		subject { create(:role) }
		it { should have_many(:user_roles).dependent(:destroy) }
		it { should have_many(:users).through(:user_roles) }
	end

	#
	describe "methods" do
		it "sorts" do
			Authentication::Role.sorted_by(:name, :asc)
		end

		#
		it "creates by attributes" do
			attributes = attributes_for(:role)
			role = Authentication::Role.create_by(attributes)
			role.should be_valid
		end

		#
		it "updates by id" do
			name = "test"
			role = create(:role)
			role = Authentication::Role.update_by_id(role.id, :name => name)
			role.should be_valid
			role.name.should == name
		end

		#
		it "destroys by id" do
			role = create(:role)
			Authentication::Role.destroy_by_id(role.id)
		end

	end
end
