#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
require "rails/all"
require "will_paginate"
require "haml-rails"
require "mambo-support"

require "authentication/version"
require "authentication/engine"
require "authentication/authenticated_user"
require "authentication/authenticated_controller"
