# -*- encoding : utf-8 -*-
require "spec_helper"

describe Authentication::RolesController do
	context "authenticated" do

		before(:each) do
			user = create(:user)
			controller.stub(:authenticated_user => user)
		end

		it "GET!!!" do
			get(:index, :use_route => :authentication)
		end
	end

	#context "test" do
	#	before do
	#		create(:user)
	#		get(:index)
	#	end
	#	it { should assign_to(:users) }
	#	it { should respond_with(:success) }
	#	it { should render_template(:index) }
	#	it { should_not set_the_flash }
	#end
end
