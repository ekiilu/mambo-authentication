Authentication::Engine.routes.draw do
	root(:to => "sessions#new")

	# sessions
	resources(:sessions, :only => [:new, :create, :destroy])

	# users
	resources(:users, :only => [:index, :new, :create, :edit, :update, :destroy])

	# roles
	resources(:roles, :only => [:index, :new, :create, :edit, :update, :destroy])
end
