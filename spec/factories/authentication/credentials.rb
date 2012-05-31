# -*- encoding : utf-8 -*-
FactoryGirl.define do
	#
	factory(:credentials, :class => Authentication::Credentials) do |c|
		c.email_address "system@verticallabs.ca"
		c.password "password"
	end
end
