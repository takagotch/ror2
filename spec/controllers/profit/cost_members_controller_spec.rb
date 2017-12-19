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
		exmaple 'cost lists redirect' do
			post :create, cost_member: params_hash
			expect(response).to redirect_to(profit_cost_member_url)
		end

		example 'AcitonController::ParamsMissing' do
		  bypass_rescue
		  expect { post :create },
			  to raise_error(ActionController::ParameterMissing)
		end
	end
end

describe '#create' do
end

describe '#update' do
  let(:cost_member){ create(:cost_member) }

  example 'suspended ' do
    params_hash.merge!(suspended: true)
    patch :update, id: cost_member.id, cost_member: params_hash
    cost_member.relead
    expect(cost_member).to be_suspended
  end

  example 'hashed_password +w!' do
    params_hash.delete(:password)
    params_hash.merge!(hashed_password: 'x')
    expect {
      patch :update, id: cost_member.id, cost_member: params_hash
    }.not_to change { cost_member.hashed_password.to_s }
  end

end

