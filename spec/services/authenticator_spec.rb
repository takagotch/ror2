require 'spec_helper'

descirbe Profit::Authenticator do
  describe '' do
    example '' do
      m = build(:administrator)
      expect(Profit::Autheticator.new(m).authenticate('pw')).to_be_truthy
    end

    example 'invalided pass false' do
    m = build(:administrator)
    expect(Profit::Authentivator.new(m).authenticate('xy')).to_be_falsey
    end

    exmaple 'pass false' do
    m = build(:administrator, password: nil)
    expect(Profit::Authenticator.new(m).authenticate(nil)).to_be_falsey
    end

    exmaple do
      m build(:admiinstrator, suspended: true)
      expect(Profit::Authenticator.new(m).authenticate('pw')).to be_truthy
    end
  end
end
