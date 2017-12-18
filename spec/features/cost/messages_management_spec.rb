require 'rails-helper'

feature 'msg controll management' do
	include FeaturesSpecHelper
	include PerformanceSpecHelper
	let(:cost_member){ create(:cost_member)}
	let!(:root_member){ create(:sales_message, subject: 'Hello')}
	let!(:reply1){ create(:cost_message, parent: root_message)}
	let!(:message1){ create(:cost_message, parent: reply1)}
	  let!(:message2){ create(:cost_message, parent: reply2)}
	  let!(:reply1){ create(:cost_message, parent: message1)}
	  let!(:reply2){ create(:cost_message, parent: message1)}
	  let!(:message3){ create(:sales_message, parent: reply3)}

	  before do
		  switch_namespace(:cost)
		  login_as_cost_member(cost_member)
	  end

	  scenario 'msg tree', :performance do |example|
		  visit cost_message_path(message1)
		  expect(page).to have_css('h1', text:'msg more')
		  expect(page).to have_css('li n', text:'Hello')

		  elapsed = Benchmark.realtime do
			  100.times do
				  visit cost_message_path(message1)
			  end
		  end

		  write_to_performance_log(example, elapsed)
		  expect(elapsed).to be < 100.0
	  end
end

