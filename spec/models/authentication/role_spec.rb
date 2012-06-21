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
