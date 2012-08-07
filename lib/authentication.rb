# -*- encoding : utf-8 -*-
require "rails/all"
require "will_paginate"
require "haml-rails"
require "mambo-support"

module Authentication
end

require "authentication/version"
require "authentication/engine"
require "authentication/authenticated_user"
require "authentication/authenticated_controller"
