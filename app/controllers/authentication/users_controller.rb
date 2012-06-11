# -*- encoding : utf-8 -*-
module Authentication
	class UsersController < BaseController
		include AuthenticatedController
		respond_to(:html)
		layout("private/authentication")

    before_filter(:only => :index) do
    	page_param(:users)
      sort_param(:users, :name, :asc)
    end

		# list users
		def index
			@users = User.sorted_by(@sort_key, @sort_order).paginate(:page => @page, :per_page => 20)
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
        user = params[:user]
				@user = User.create_by(user)
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
        user = params[:user]
        user.delete(:password) if user.password.blank?
				@user = User.update_by_id(params[:id], user)
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
