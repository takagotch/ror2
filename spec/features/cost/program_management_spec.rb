require 'rails_helper'

feature 'program control function', :performance do
	include FeaturesSpecHelper
	include PerformanceSpecHelper
	let(:cost_member){ create(:cost_member) }

	before do
		20.times do |n|
			p = create(:program, application_start_time: n.days.ago.midnight)
			if n < 2
				p.applicants << create(:sales)
				p.applicants << create(:sales)
			end
		end

		switch_namespace(:cost)
		login_as_cost_member(cost_member)
	end

	scenario 'program lists' do |example|
		visit cost_program_path
		expect(page).to have_css('h1', text: 'program controll')
		puts page.body

		elapsed = Benchmark.realtime do
			100.times do
				visit cost_programs_path
			end
		end

		write_to_performance_log(example.elapsed)
		expect(elapsed).to be < 100.0
	end
end

