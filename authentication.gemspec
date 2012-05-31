# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "authentication/version"

Gem::Specification.new do |s|
  s.name        = "mambo-authentication"
  s.version     = Authentication::VERSION
  s.authors     = ["Chris Dion"]
  s.email       = ["chris@verticallabs.ca"]
  s.homepage    = ""
  s.summary     = %q{Mambo Authentication}
  s.description = %q{Mambo Authentication}

  s.rubyforge_project = "mambo-authentication"

	s.files = Dir["{app,config,lib}/**/*"] + ["Rakefile"]
	s.test_files = Dir["test/**/*"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "rails"
  s.add_runtime_dependency "dm-core", Authentication::DM_VERSION
	s.add_runtime_dependency "dm-rails", Authentication::DM_VERSION
	s.add_runtime_dependency "dm-types", Authentication::DM_VERSION
	s.add_runtime_dependency "dm-validations", Authentication::DM_VERSION
	s.add_runtime_dependency "dm-constraints", Authentication::DM_VERSION
	s.add_runtime_dependency "dm-transactions", Authentication::DM_VERSION
	s.add_runtime_dependency "dm-timestamps", Authentication::DM_VERSION	
	s.add_runtime_dependency "dm-pager"
	s.add_runtime_dependency "dm-accepts_nested_attributes"
	s.add_runtime_dependency "haml-rails"
	
	s.add_development_dependency "rspec-rails"
	s.add_development_dependency "factory_girl"
	s.add_development_dependency "dm-core", Authentication::DM_VERSION
	s.add_development_dependency "dm-rails", Authentication::DM_VERSION
	s.add_development_dependency "dm-migrations", Authentication::DM_VERSION
	s.add_development_dependency "dm-sqlite-adapter", Authentication::DM_VERSION
	s.add_development_dependency "database_cleaner"
	s.add_development_dependency "combustion"
	s.add_development_dependency "magic_encoding"
end
