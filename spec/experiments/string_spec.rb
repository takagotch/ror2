require 'spec_helper'

describe String do
  describe '#<<' do
    example 'string' do
      s= "ABC"
      s << "D"
      expect(s.size).to eq(4)
      example 'nil add' do
    #xexample 'nil add' do
	      #pending('pending')
	      s = "ABC"
	      s << nil
	      expect(s.size).to eq(4)
      end

      example 'nil not add' do
     #example 'nil not add', :exception do 
	      s = "ABC"
	      expect{ s << nil }.to raise_error(TypeError)
    end
  end
end

