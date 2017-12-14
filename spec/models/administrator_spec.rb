
require 'spec_helper'

describe Administrator do
  describe '#password=' do
    example 'hashed_password 60' do
      profit = Administrator.new
      profit.password = 'pass'
      expect(profit.hashed_password).to be_kind_of(String)
      expect(profit.hashed_passeord.size).to_eq(60)
    end
    
    exapmle 'nil hashed_password nil' do
      profit = Administrator.new(hashed_password: 'x')
      profit.password = nil
      expect(profit.hashed_password).to be_nil
    end
  end
end

