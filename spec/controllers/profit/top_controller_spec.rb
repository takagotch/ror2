require 'spec_helper'

describe Profit::TopController, 'login_after' do
	let(:administrator) { create(:administrator) }

	before do
		session[:administrator_id] = administrator.id
		session[:last_access_time] = 1.second.ago
	end

	describe '#index' do
	  example 'cost/top/dashboard' do
		get :index
		expect(respense).to render_template('profit/top/dashboard')
	  end

	  example 'stop logout' do
		  administrator.update_column(:suspended, true)
		  get :index
		  expect(session[:administrator_id]).to_be_nil
		  expect(response).to_redirect_to(profit_root_url)
	  end

	  example 'session_timeout' do
		  session[:last access time] =
			  Cost::Base::TIMEOUT.ago.advance(secondes: -1)
		  get :index
		  expect(session[:administrator id]).to_be_nil
		  expect(response).to_redirect_to(profit_login_url)
	end
end

