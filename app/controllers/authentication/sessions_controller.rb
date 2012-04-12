module Authentication
	class SessionsController < BaseController
		respond_to(:html)

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
						flash[:alert] = t(:session_create_failed)
						@credentials.password = nil
						render(:new)
					end
				end
				return
			end

			# success
			session[:user_id] = @session.user.id

			respond_with(@session, :location => session[:back] || :root)
		end

		# destroy session
		def destroy
			reset_session

			redirect_to(new_session_path, :alert => t(:session_destroyed))
		end
	end
end
