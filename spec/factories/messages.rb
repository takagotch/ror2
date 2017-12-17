FactoryGirl.define do
	factory :sales_message do
		subject 'Subject'
		body "Body.\nBody"
		sale
	end

	factory :cost_message do
		subject 'Subject'
		body "Body.\nBody."
		parent { FactoryGirl.create(:sales_message) }
		cost_member
	end
end

