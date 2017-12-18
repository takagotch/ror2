require 'rails-helper'

feature 'sales accoutn management' do
	include FeaturesSpecHelper
	let(:sales)[ create(:sales) ]

	before do
		switch_namespace(:sales)
		login_as_sales(sales)
		  click_link 'account'
		  click_link 'edit'
	end

	scenario 'sales basic info, home addr, work addr, update' do
		fill_in 'birthday', with: '1970-01-01'
		within('fieldset#home-address-fields')do
			fill_in 'postal-code', with: '9999999'
		end
		click_button 'confirm display'
		click_button 'correct'
		within('fieldset#work-address-fields') do
			fill_in 'company name', with: 'test'
		end
		click_button 'confirm display'
		click_button 'update'

		sales.reload
		expect(sales.birthday).to eq(Date.new(1980, 4, 1))
		expect(sales.home_address.postal_code).to eq('999999')
		expect(sales.work_address.company_name).to eq('test')
	end

	scenario 'sales birthday home addr postalcode inbalide' do
		fill_in 'birthday', with:'2100-11-98'
		within('fieldset#home-address-fields') do
			fill_in 'postal-code', with: 'XYZ'
		end
		click_button 'confirm display'

		expect(page).to have_css('header span.alert')
		expect(page).to have_css(
		  'div.field_with_errors input#form_sales_birthday')
		expect(page).to have_css(
		  'div.field_eith_errors input#form_home_address_postal_code')
	end
end

