# -*- encoding : utf-8 -*-
require "spec_helper"

describe Authentication::Session do
	#
	describe "validations" do
		subject { build(:session) }
		it { should validate_presence_of(:user) }
	end
end