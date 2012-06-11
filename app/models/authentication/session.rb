# -*- encoding : utf-8 -*-
module Authentication
	class Session
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

		# attributes
    attr_accessor(:user)

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
