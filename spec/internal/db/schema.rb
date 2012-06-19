puts File.join(__FILE__, "..", "..", "..", "db", "migrate", "**", "*.rb")

Dir[File.join(__FILE__, "..", "..", "..", "db", "migrate", "**", "*.rb")].each { |f| require f }

ActiveRecord::Schema.define do
  #
end
