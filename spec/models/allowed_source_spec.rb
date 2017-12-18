require 'rails_helper'

describe AllowedSource do
  describe '#ip_address=' do
	  example '127.0.0.1' do
	    src = AllowedSource.new(namespace: 'cost', ip_address: '127.0.0.1')
	    expect(src.octet1).to eq(127)
	    expect(src.octet2).to eq(0)
	    expect(src.octet3).to eq(0)
	    expect(src.octet4).to eq(1)
	    expect(src).not_to be_wildcard
	    expect(src).to be_valid
	  end

	  example '192.168.0.' do
	    src = AllowedSource.new(namespace: 'cost', ip_address: '192.168.0.*')
	    expect(src.octet1).to eq(192)
	    expect(src.octet2).to eq(168)
	    expect(src.octet3).to eq(0)
	    expect(src.octet4).to eq(0)
	    expect(src).to be_wildcard
	    expect(src).to be_valid
	  end

	  example 'string' do
	    src = AllowedSource.new(namespace: 'cost', ip_address:'A.B.C.D')
	    expect(src).not_to be_valid
	  end
  end

describe '.include?' do
  before do
    Rails.application.config.ror2[:restrict_ip_address] = true
    AllowedSource.create!(namespace: 'cost', ip_address: '127.0.0.1')
    AllowedSource.create!(namespace: 'cost', ip_address: '192.168.0.')
  end

  example 'not match' do
    expect(AllowedSource.include?('cost', '192.168.1.1')).to be_falsey
  end

  example 'all_octet match' do
    expect(AllowedSource.include?('cost', '127.0.0.1')).to be_truthy
  end

  example 'AllowedSource match' do
    expect(AllowedSource.include?('cost', '192.168.0.100')).to be_truthy
  end
end

end

