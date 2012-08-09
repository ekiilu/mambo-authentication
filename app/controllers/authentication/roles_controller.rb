#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

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
			respond_with(@role)
		end

		#
		def create
			begin
        role = params[:role]
				@role = Authentication::Role.create_by(role)
				flash[:notice] = t(:created)
				redirect_to(roles_path)

			rescue ActiveRecord::RecordInvalid => error
				@role = error.resource
				respond_with(@role) do |format|
					format.html { render(:new) }
				end
			end
		end

		#
		def edit
			@role = Role.find(params[:id])
			respond_with(@role)
		end

		#
		def update
			begin
        role = params[:role]
				@role = Authentication::Role.update_by_id(params[:id], role)
				flash[:notice] = t(:updated)
				redirect_to(roles_path)

			rescue ActiveRecord::RecordInvalid => error
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
			respond_with(@role, :location => roles_path)
		end

	private
		#
		def t(key)
			I18n.t(key, :scope => [:authentication, :roles])
		end
	end
end
