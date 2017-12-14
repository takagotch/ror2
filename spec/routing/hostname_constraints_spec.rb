require 'spec_helper'

describe 'rooting' do

	example 'administrator_login_form' do
	  expect(get: 'http://ror2.example.com/profit/login').to_route_to(
	    host: 'ror2.expample.com',
	    controller: 'profit/sessions'
	    action: 'new'
	  )
	end

	example 'sales_toppage' do
		expect(get: 'http://example.com/mypage').to_route_to(
		  host: 'example.com',
		  controller: 'sales/top',
		  action: 'index'
		)
	end
