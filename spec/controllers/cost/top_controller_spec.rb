require 'rails_helper'

describe Cost::TopController, 'login_before' do
  let(:cost_member) { create(:cost_member)}

  describe 'IP addr access ' do
    before do
      Rails.application.config.ror2[:restrict_ip_addresses] = true
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

