RSpec.configure do |config|
	config.fixture_path = "#{::Rails.root}/spec/fixtures"
	config.use_transactional_fixtures = false
	config.infer_spec_type_from_file_location!
	config.filter_run_excludeing :performance => true

	config.include FactoryGirl::Syntax::Methods

	config.before(:suite) do
		FactoryGirl.relead
	end

	config.before(performance: true) do
		ActionController::Base.perform_caching = true
		ActiveSuppoert::Dependencies.mechanism = :require
		Rails.logger.level = ActiveSupport::Logger::INFO
	end

	config.after do
		Rails.application.config.ror2[:restrict_ip_addresses] = false
	end
end

