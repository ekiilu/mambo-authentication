#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
module Authentication
	class UsersController < BaseController
		include AuthenticatedController
		respond_to(:html)
		layout("private/authentication")

    before_filter(:only => :index) do
    	page_param(:users, 20)
      sort_param(:users, "", :name, :asc)
    end

		# list users
		def index
			@users = User
				.sorted_by(@sort_attribute, @sort_order)
				.paginate(:page => @page, :per_page => @per_page)
			respond_with(@users)
		end

		# new user form
		def new
			@user = User.new
			@user.user_roles.new
			respond_with(@user)
		end

		# create new user
		def create
			begin
				Authentication::User.transaction do
					user = params[:user]
					@user = User.create!(user)
					flash[:notice] = t(:created)
					respond_with(@user, :location => users_path)
				end

			rescue ActiveRecord::RecordInvalid => error
				@user = error.record
				respond_with(@user) do |format|
					format.html { render(:new) }
				end
			end
		end

		# edit user form
		def edit
			@user = User.find(params[:id])
			respond_with(@user)
		end

		# update user
		def update
			begin
				Authentication::User.transaction do
					user = params[:user]
					user.delete!(:password) if user[:password].blank?
					@user = User.find(params[:id])
					@user.attributes = user
					@user.save!
					flash[:notice] = t(:updated)
					redirect_to(users_path)
				end

			rescue ActiveRecord::RecordInvalid => error
				@user = error.record
				respond_with(@user) do |format|
					format.html { render(:edit) }
				end
			end
		end

		# destroy user
		def destroy
			Authentication::User.transaction do
				@user = User.find(params[:id])
				@user.destroy
				flash[:notice] = t(:destroyed)
				respond_with(@user, :location => users_path)
			end
		end

	private
		#
		def t(key)
			I18n.t(key, :scope => [:authentication, :users])
		end
	end
end
