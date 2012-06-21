# -*- encoding : utf-8 -*-
require "spec_helper"

describe Authentication::UsersController do
	context "test" do
		before(:each) do
		end

		before do
			create(:user)
			get(:index, :use_route => :authentication)
		end

		it { should assign_to(:users) }
		it { should respond_with(:success) }
		it { should render_template(:index) }
		it { should_not set_the_flash }
	end
end
