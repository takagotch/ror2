require 'spec_helper'

describe 'routing' do
  example 'cost toppage' do
	  expect(get: 'http://ror2.ex.com').to route_to(
		  host: 'ror2.ex.com',
		  controller: 'cost/top',
		  action: 'index'
	  )
  end
  
  example 'profit loginform' do
	  expect(get: 'http://ror2.ex.com/profit/login').to route_to(
		  host: 'ror2.example.com',
		  controller: 'profit/sessions',
		  action: 'new'
	  )
  end
end

