# -*- encoding : utf-8 -*-
FactoryGirl.define do
	#
	factory(:credentials, :class => Authentication::Credentials) do
		email_address "system@verticallabs.ca"
		password "password"
	end
end
