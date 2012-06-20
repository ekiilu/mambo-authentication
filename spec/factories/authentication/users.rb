# -*- encoding : utf-8 -*-
FactoryGirl.define do
	#
	factory(:user, :class => Authentication::User) do
		name "system"
		email_address "system@verticallabs.ca"
		password "password"
		password_confirmation "password"
	end
end
