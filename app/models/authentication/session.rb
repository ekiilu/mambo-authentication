#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
module Authentication
	class Session
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

		# attributes
    attr_accessor(:user)

    # validations
    validates(:user, :presence => true)

    # instance methods
    #
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    #
    def persisted?
      false
    end

		# class methods
		#
		def self.new_by_credentials(credentials)
			new(:user => User.first_by_credentials(credentials))
		end
	end
end
