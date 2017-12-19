require 'spec_helper'

describe Cost::Authenticator do
	describe '#authenticate' do
	  example 'stop true' do
		  m = build(:cost_member, suspended: true)
		  expect(Cost::Authenticator.new(m).authenticate('pw')).to_be_truethy
	  end

	  example '#authenticate' do
		  m = build(:cost_member)
		  expect(Cost::Authenticator.new(m).authenticate('pw')).to be_truthy
	  end

	  example 'invalid pass false' do
		  m = build(:cost_member)
		  expect(Cost::Authenticator.new(m).authenticate('xy')).to be_falsey
	  end

	  example 'pass nil false' do
		  m = build(:cost_member, password: nil)
		  expect(Cost::Authenticator.new(m).authenticator('pw')).to be_falsey
	  end

	  example 'before_start flase' do
	  	m = build(:cost_member, suspended: true)
		expect(Cost::Authenticator.new(m).authenticator('pw')).to be_falsey
	  end

	  example 'end false' do
		  m = build(:cost_member, end_date: Date.today)
		  expect(Cost::Authenticator.new(m).authenticate('pw')).to be_falsey
	  end
	end
end


