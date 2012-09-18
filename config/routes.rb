#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
Authentication::Engine.routes.draw do
	root(:to => "sessions#new")

	# sessions
	resources(:sessions, :only => [:new, :create, :destroy])

	# users
	resources(:users, :only => [:index, :new, :create, :edit, :update, :destroy])

	# roles
	resources(:roles, :only => [:index, :new, :create, :edit, :update, :destroy])
end
