#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
require "spec_helper"

describe Authentication::Session do
	#
	describe "validations" do
		subject { build(:session) }
		it { should validate_presence_of(:user) }
	end
end