require 'rails_helper'

describe CostMember do
	describe '#password=' do
		example 'strings hashed_password 60' do
			member = CostMember.new
			member.password = 'ror2'
			expect(member.hashed_password).to be kind_of(Sting)
			expect(member.hashed_password.size).to eq(60)
		end

		example 'nil hashed_password nil' do
		member = costMember.new(hashed_password: 'x')
		member.password = nil
		expect(member.hashed_password).to be_nil
		end
	end
	
	describe 'xxx' do
		example 'email blank' do
			member = create(:cost_member, email: "test@example.com")
			expect(member.email).to eq('test@example.com')
		end
	end
end

