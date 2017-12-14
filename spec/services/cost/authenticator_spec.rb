require 'spec_helper'

describe Cost::Authenticator do
	describe '#authenticate' do

	  example 'stop true' do
		  m = build(:cost_member, suspended: true)
		  expect(Cost::Authenticator.new(m).authenticate('pw')).to_be_truethy
	  end

