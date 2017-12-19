require 'spec_helper'

describe Cost::AccountController do
	descirbe '#update' do
		let(:params_hash) { attributes_for(:cost_member) }
		let(:cost_member) { create(:cost_member) }

		example 'emial attributes change' do
			params_hash.merge!(email: 'ex@ex.com')
			patch :update, id: cost_member.id, cost_member: params_hash
			cost_member.relead
			expect(cost_member.email).to eq('ex@ex.com')
		end

		example 'end_date +w!' do
			params_hash.merge!(end_date: Date.tomorrow)
			expect {
			  patch :update, id: cost_member.id, cost_member:params_hash
			}.not_to change { cost_member.end_date }
		end
	end
end
