require 'spec_helper'

describe Profit::CostMembersController, 'login before' do
  it_behaves_like 'a protected profit controller'
end

describe Profit::CostMembersController do
	let(:params_hash)   { attributes_for(:cost_member) }
	let(:administrator) { create(:administrator) }

	before do
		session[:administrator_id] = administrator.id
		session[:last_access_time] = 1.second.ago
	end

	describe '#create' do
	end
end

