module Authentication
	class RolesController < BaseController
		include Authentication::AuthenticatedController
		respond_to(:html)

		#
		def index
			@page = params[:page]
			@roles = Role.all.page(:page => @page, :per_page => 6, :order => :name)
			respond_with(@roles)
		end

		#
		def new
			@role = Role.new
		end

		#
		def create
			begin
				@role = Authorization::Role.create_by(params[:role])
				flash[:notice] = t(:created)
				redirect_to(roles_path)

			rescue DataMapper::SaveFailureError => error
				@role = error.resource
				respond_with(@role) do |format|
					format.html { render(:new) }
				end
			end
		end

		#
		def edit
			@role = Role.get!(params[:id])
		end

		#
		def update
			begin
				@role = Authorization::Role.update_by_id(params[:id], params[:role])
				flash[:notice] = t(:updated)
				redirect_to(roles_path)

			rescue DataMapper::SaveFailureError => error
				@role = error.resource
				respond_with(@role) do |format|
					format.html { render(:edit) }
				end
			end
		end

		#
		def destroy
			@role = Role.destroy_by_id(params[:id])
			flash[:notice] = t(:destroyed)
			respond_with(@role, :location => roless_path)
		end

	private
		#
		def t(key)
			I18n.t(key, :scope => [:authorization, :roles])
		end
	end
end
