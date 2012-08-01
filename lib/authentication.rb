# -*- encoding : utf-8 -*-
require "rails"
require "dm-core"
require "dm-rails"
require "dm-types"
require "dm-validations"
require "dm-constraints"
require "dm-transactions"
require "dm-timestamps"
require "dm-accepts_nested_attributes"
require "will_paginate"
require "haml-rails"
require "mambo-support"

module Authentication
end

require "authentication/version"
require "authentication/engine"
require "authentication/authenticated_user"
require "authentication/authenticated_controller"
