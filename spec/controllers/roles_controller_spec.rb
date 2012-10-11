#-  -*- encoding : utf-8 -*- 
#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
require "spec_helper"

describe Authentication::RolesController do
	context "with authentication" do
		before(:each) do
			controller.stub(:authenticated_user => build(:user))
		end

		#
		context "index" do
			before do
				create(:role)
				get(:index, :use_route => :authentication)
			end

			it { should assign_to(:roles) }
			it { should respond_with(:success) }
			it { should render_template(:index) }
		end

		#
		context "new" do
			before do
				get(:new, :use_route => :authentication)
			end

			it { should assign_to(:role) }
			it { should respond_with(:success) }
			it { should render_template(:new) }
		end

		#
		context "create" do
			before do
				role_attributes = attributes_for(:role)
				post(:create, :use_route => :authentication, :role => role_attributes)
			end

			it { should assign_to(:role) }
			it { should set_the_flash }
			#it { should redirect_to(:index) }
		end

		#
		context "edit" do
			before do
				role = create(:role)
				get(:edit, :use_route => :authentication, :id => role.id)
			end

			it { should assign_to(:role) }
			it { should respond_with(:success) }
			it { should render_template(:edit) }
		end

		#
		context "update" do
			before do
				role = create(:role)
				role_attributes = attributes_for(:role)
				post(:update, :use_route => :authentication, :id => role.id, :role => role_attributes)
			end

			it { should assign_to(:role) }
			it { should set_the_flash }
			#it { should redirect_to(:index) }
		end

		#
		context "destroy" do
			before do
				role = create(:role)
				delete(:destroy, :use_route => :authentication, :id => role.id)
			end

			it { should assign_to(:role) }
			it { should set_the_flash }
			#it { should redirect_to(:index) }
		end
	end
end
