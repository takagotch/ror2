cost_members = CostMember.order(:id)

20.times do |n|
	t = (18 - n).weeks.ago.midnight
	Program.create!(
		title: "Programs No.#{n + 1}",
	desctipton: "registered special programs" * 10,
	application_start_time: t,
	application_end_time: t.advance(days: 7),
	registrant: cost_members.sample
	)
end

