#-  -*- encoding : utf-8 -*- 
#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
module Authentication
	class Credentials
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor(:email_address, :password)

		# validations
		validates(:email_address, :length => {:maximum => 128}, :format => //)
		validates(:password, :length => {:in => 6..32}, :format => /^\w*$/)

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
	end
end
