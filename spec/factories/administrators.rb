
FactoryGirl.define do
	factory :administrator do
		sequence(:email) { |n| "profit#{n}@example.com"}
		password 'pw'
		suspended false
	end
end

