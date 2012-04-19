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
			@credentials = Credentials.new(params[:credentials])

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

			@session = Session.create_by(@credentials)

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
