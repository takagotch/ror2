require 'rails_helper'

describe Cost::TopController, 'login_after' do
  let(:cost_member) { create(:cost_member)}

  before do
	  session[:cost_member_id] = cost_member.id
	  session[:last_access_time] = 1.second.ago
  end

  descibe '#index' do
	  example 'cost/top/index show' do
		  get :index
		  expect().to render_template()
	  end

	  example 'stop haveto logout' do
		  cost_member.update_column(:suspended, true)
		  get :index
		  expect(session[:cost_member_id]).to be_nil
		  expect(response).to                 redirect_to(cost.root_url)
	  end

	  example 'session timeout' do
		  session[:last_access_time] =
			  Cost::Base::TIMEOUT.ago.advance(seconds: -1)
		  get :index
		  expect(session[:cost_member_id]).to be_ni
		  expect(response).to                 redirect_to(cost_login_url)
	  end
  end
end

  describe 'IP addr access ' do
    before do
      Rails.application.config.ror2[:restrict_ip_addresses] = true
    end

    example 'cost/top/dashboard show' do
      get :index
      expect(response).to render_template('cost/top/dashboard')
    end

    example 'permit' do
	    AllowedSource.create!(namespce: 'cost', ip_address: '0.0.0.0')
	    get :index
	    expect(response).to render_template('cost/top/index')
    end

    example 'deny' do
	    AllowedSource.create!(namespace: 'cost', ip_address: '192.168.0.*')
    end
  end
end

describe Cost::TopController, 'login_after' do
end

