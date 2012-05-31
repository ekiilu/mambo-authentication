# -*- encoding : utf-8 -*-
module Authentication
	class UsersController < BaseController
		include AuthenticatedController
		respond_to(:html)
		layout("private/authentication")

		# list users
		def index
			@page = params[:page]
			@users = User.search(@page, 20, :name)
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
				@user = User.create_by(params[:user])
				flash[:notice] = t(:created)
				respond_with(@user, :location => users_path)

			rescue DataMapper::SaveFailureError => error
				@user = error.resource
				respond_with(@user) do |format|
					format.html { render(:new) }
				end
			end
		end

		# edit user form
		def edit
			@user = User.get!(params[:id])
			respond_with(@user)
		end

		# update user
		def update
			begin
				@user = User.update_by_id(params[:id], params[:user])
				flash[:notice] = t(:updated)
				redirect_to(users_path)

			rescue DataMapper::SaveFailureError => error
				@user = error.resource
				respond_with(@user) do |format|
					format.html { render(:edit) }
				end
			end
		end

		# destroy user
		def destroy
			@user = User.destroy_by_id(params[:id])
			flash[:notice] = t(:destroyed)
			respond_with(@user, :location => users_path)
		end

	private
		#
		def t(key)
			I18n.t(key, :scope => [:authentication, :users])
		end
	end
end
