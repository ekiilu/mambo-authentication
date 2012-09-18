#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
ENV["RAILS_ENV"] ||= "test"

require "rubygems"
require "bundler"

Bundler.require(:default, :assets, :development) if defined?(Bundler)

$:.push File.expand_path("../lib", __FILE__)
$:.push File.expand_path("../app", __FILE__)

# combustion
Combustion.initialize!

spec_path = File.expand_path("../", __FILE__)

# factory girl
Dir[File.join(spec_path, "factories", "**", "*.rb")].each { |f| require f }

# rspec
require "rspec/rails"
Dir[File.join(spec_path, "support", "**", "*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.before(:suite) do
		DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
  	Rails.logger.debug(example.full_description)
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include(FactoryGirl::Syntax::Methods)
end
