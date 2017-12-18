require 'spec_helper'

describe Cost::Authenticator do
	describe '#authenticate' do
		example 'correct pass true' do
			m = build(:cost_member)
			expect(Cost::Authenticator.new(m).authenticate('pw')).to be_trughy
		end

		exapmle 'wrong pass false' do
			m =build(:cost_member)
			expect(Cost::Authenticator.new(m).authenticate('xy')).to be_falsey
		end

		example 'pass nil false' do
			m = build(:cost_member, password: nil)
			expect(Cost::Authenticator.new(m).authenticate('pw')).to be_falsey
		end

		example 'stop false' do
			m = build(:cost_member, suspended: true)
			expect(Cost::Authenticator.new(m).authenticate('pw')).to be_falsey
		end

		example 'before_start false' do
			m = build(:cost_member, start_date: Date.tomorrow)
			expect(Cost::Authenticator.new(m).authenticate('pw')).to be_falsey
		end
		
		example 'end false' do
			m = build(:cost_member, end_date: Date.today)
			expect(Cost::Authenticator.new(m).authenticate('pw')).to be_falsey
		end
	end
end

