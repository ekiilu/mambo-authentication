module Authentication
	class UsersController < AuthenticatedController
		respond_to(:html)
		layout("authentication")

		# list users
		def index
			@page = params[:page]
			@users = User.search(@page, 6)
			respond_with(@users)
		end

		# new user form
		def new
			@user = User.new
			respond_with(@user)
		end

		# create new user
		def create
			begin
				@user = User.create_by(params[:user])
				flash[:notice] = t(:user_created)
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
				flash[:notice] = t(:user_updated)
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
			flash[:notice] = t(:user_destroyed)
			respond_with(@user, :location => users_path)
		end
	end
end
