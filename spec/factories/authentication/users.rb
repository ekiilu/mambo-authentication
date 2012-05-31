# -*- encoding : utf-8 -*-
FactoryGirl.define do
	#
	factory(:user, :class => Authentication::User) do |u|
		u.name "system"
		u.email_address "system@verticallabs.ca"
		u.password "password"
		u.password_confirmation "password"
	end
end
