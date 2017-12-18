
module FeatureSpecHelper
def switch_namespace(namespace)
	config = Rails.application.config.ror2
	Capybara.app_host = 'http://' + config[namespace][:host]
end

def login_as_cost_member(cost_member, password = 'pw')
visit cost_login_path
within('#login-form') do
	fill_in 'E-mail', with: cost_member.email
	fill_in 'password', with: password
	click_button 'login'
end
end

end

