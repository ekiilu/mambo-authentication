#-  -*- encoding : utf-8 -*- 
#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
require "spec_helper"

describe Authentication::UsersController do
	#
	context "with authentication" do
		before(:each) do
			controller.stub(:authenticated_user => build(:user))
		end

		#
		context "index" do
			before do
				create(:user)
				get(:index, :use_route => :authentication)
			end

			it { should assign_to(:users) }
			it { should respond_with(:success) }
			it { should render_template(:index) }
		end

		#
		context "new" do
			before do
				get(:new, :use_route => :authentication)
			end

			it { should assign_to(:user) }
			it { should respond_with(:success) }
			it { should render_template(:new) }
		end

		#
		context "create" do
			before do
				user_attributes = attributes_for(:user)
				post(:create, :use_route => :authentication, :user => user_attributes)
			end

			it { should assign_to(:user) }
			it { should set_the_flash }
			#it { should redirect_to(:index) }
		end

		#
		context "edit" do
			before do
				user = create(:user)
				get(:edit, :use_route => :authentication, :id => user.id)
			end

			it { should assign_to(:user) }
			it { should respond_with(:success) }
			it { should render_template(:edit) }
		end

		#
		context "update" do
			before do
				user = create(:user)
				user_attributes = attributes_for(:user)
				put(:update, :use_route => :authentication, :id => user.id, :user => user_attributes)
			end

			it { should assign_to(:user) }
			it { should respond_with(:redirect) }
			it { should set_the_flash }
		end

		#
		context "destroy" do
			before do
				user = create(:user)
				delete(:destroy, :use_route => :authentication, :id => user.id)
			end

			it { should assign_to(:user) }
			it { should respond_with(:redirect) }
			it { should set_the_flash }
		end
	end
end
