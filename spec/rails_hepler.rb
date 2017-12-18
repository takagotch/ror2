
config.before(:suite) do
  FactoryGirl.reload
end

config.after do
  Rails.application.config.ror2[:restrict_ip_addresses] = false
end
end

