# -*- encoding : utf-8 -*-
module Authentication
	class RolesController < BaseController
		include AuthenticatedController
		respond_to(:html)
		layout("private/authentication")

    before_filter(:only => :index) do
      page_param(:roles)
      sort_param(:roles, :name, :asc)
    end

		#
		def index
			@roles = Role.sorted_by(@sort_key, @sort_order).paginate(:page => @page, :per_page => 20)
			respond_with(@roles)
		end

		#
		def new
			@role = Role.new
		end

		#
		def create
			begin
				@role = Authentication::Role.create_by(params[:role])
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
				@role = Authentication::Role.update_by_id(params[:id], params[:role])
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
			@role = Authentication::Role.destroy_by_id(params[:id])
			flash[:notice] = t(:destroyed)
			respond_with(@role, :location => roless_path)
		end

	private
		#
		def t(key)
			I18n.t(key, :scope => [:authentication, :roles])
		end
	end
end
