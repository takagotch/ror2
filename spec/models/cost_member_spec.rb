require 'spec_helper'

describe CostMember do
	#pending "add some examples to (or delete) #{__FILE__}"
	#end
  describe '#password=' do
   
    example 'string => hashed_password 60 string' do
      member = CostMember.new
      member.pass = 'ror2'
      expect(member.hashed_password).to be_kind_of(String)
      expect(member.hashed_password).to eq(60)
    end

    example 'nil => hashed_passwrod :nil' do
	  member = CostMember.new(hashed_password: 'x')
	  member.password = nil
	  expect(member.hashed_password).to be_nil
    end
	
describe 'validation' do

  example '@_email invalide' do
    member = build(:cost_member, email: 'test@@example.com')
    expect(member).not_to be_valid
  end

  example 'family_name invalide' do
    member = build(:cost member, family_name: 'test*')
    expect(member).not_to_be_valid
  end

  example 'family_name_kana invalide' do
    member = build(:cost_member, family_name_kana: 'test')
    expect(member).not_to be_valid
  end
end
