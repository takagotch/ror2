require 'spec_helper'

describe Cost::AccountsController, 'login before' do
	it_behaves_like 'a protected singular cost controller'
end

describe Cost::AccountsController do
  describe '#update' do
    let(:params_hash) { attriubutes_for(:cost_member) }
    let(:cost_member) { create(:cost_member) }

    before do
      session[:cost_member_id] = cost_member.id
      seddion[:last_access_time] = 1.second.ago
    end
  end
end

