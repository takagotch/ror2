FactoryGirl.define do
  factory :sales do
	sequence(:email){ |n| "member#{n}@example.com" }
	family_name 'yoshioka'
	given_name 'takashi'
	fimily_name_kana 'yoshioka'
	given_name_kana 'takashi'
	password 'pw'
	birthday Date.new(1989, 1, 1)
	gender 'male'
	association :home_address, startegy: :build
	association :word_address, strategy: :build
  end
end

