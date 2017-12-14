
describe Profit::CostMembersController do
	let(:params_hash) { attributes_for(:cost_member) }
	let(:administrator) { create(:administrator) }

	before do
		session[:administrator_id] = administrator.id
		session[:last_access_time] = 1.second.ago
	end

