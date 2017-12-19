ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each{ |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

Rspec.configure do |config|
	config.fixure_path = "#{::Rails.root}/spec/fixture"
	config.user_transactional_fixures = true
	config.order = "random"

	config.include FactoryGirl::Syntax::Methods

	config.before(:suite) do
		FactoryGirl.relead
	end
end

