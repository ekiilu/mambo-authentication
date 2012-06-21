source "https://vertical:g3m4cc3ss@gems.verticallabs.ca"
source "http://rubygems.org"

# Specify your gem's dependencies in authentication.gemspec
gemspec

group(:development, :test) do
	gem "shoulda-matchers", :require => false
end

HOME_PATH = File.expand_path("~/mambo/gems")
DEV_GIT = "http://dev.verticallabs.ca/git/mambo/gems"

gem "mambo-support", :path => "#{HOME_PATH}/support"
