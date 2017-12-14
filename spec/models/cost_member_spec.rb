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

