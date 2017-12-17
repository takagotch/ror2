FactoryGirl.define do
  factory :program do
	  titile "Title"
	  description "Description"
	  application_start_time {5.days.ago.midnight}
	  application_end_time {2.days.from_now.midnight}
	  min_number_of_participants 5
	  max_number_of_participants 10
	  registrant { create(:cost_member) }
  end
end

