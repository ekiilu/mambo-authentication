#-  -*- encoding : utf-8 -*- 
#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
module Authentication
	class SessionsController < BaseController
		include AuthenticatedUser
		respond_to(:html)
		layout("authentication")

		# new session form
		def new
			@credentials = Credentials.new
		end

		# create session
		def create
      credentials = params[:credentials]
			@credentials = Credentials.new(credentials)

			# invalid credentials
			if !@credentials.valid?
				respond_to do |format|
					format.html do
						@credentials.password = nil
						render(:new)
					end
				end
				return
			end

			@session = Session.new_by_credentials(@credentials)

			if !@session.valid?
				respond_to do |format|
					format.html do
						flash[:alert] = t(:create_failed)
						@credentials.password = nil
						render(:new)
					end
				end
				return
			end

			# success
			session[:user_id] = @session.user.id

			flash[:alert] = t(:created)

			respond_with(@session, :location => session[:back] || main_app.root_path)
		end

		# destroy session
		def destroy
			reset_session

			redirect_to(new_session_path, :alert => t(:destroyed))
		end

	private
		def t(key)
			I18n.t(key, :scope => [:authentication, :sessions])
		end
	end
end
