#-  -*- encoding : utf-8 -*- 
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
	end
end
