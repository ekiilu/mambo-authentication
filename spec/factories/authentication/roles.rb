# -*- encoding : utf-8 -*-
FactoryGirl.define do
	#
	factory(:role, :class => Authentication::Role) do
		name "role"
		desc "role"
	end
end
