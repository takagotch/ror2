require 'spec_helper'

feature 'cost sale_management' do
	include FeaturesSpecHelper
	let(:cost_member){ create(:cost_member) }
	let!(:sales){ create(:sales) }

	before do
	  switch_namespace(:cost)
	  login_as_cost_member(cost_member)
	end
	



	scenario 'cost sales(basic info only) create' do
	  click_link 'sales management'
	  first('div.links').click_link 'create'
	  fill_in 'E-mail',                      with: 'ex@ex.com'
	  fill_in 'password',                    with: 'pass'
	  fill_in 'form_sales_family_name',      with: 'yoshioka'
	  fill_in 'form_sales_given_name',       with: 'takashi'
	  fill_in 'form_sales_family_name_kana', with: 'yoshioka'
	  fill_in 'from_sales_given_name_kana',  with: 'takashi'
	  choose  'female'
	  click_button 'register'

	  new_sales = Sales.order(:id).last
	  expect(new_sales.email).to        eq("ex@ex.com")
	  expect(new_sales.birthday).to     eq("1994, 3, 20")
	  expect(new_sales.gender).to       eq("female")
	  expect(new_sales.home_address).to be_nil
	  expect(new_sales.work_address).to be_nil
	end

	scenario 'cost sales, home&work addr, create' do
	  click_link 'sales management'
	  first('div.links').click_link 'new create'
	  fill_in 'E-mail',                      with: 'ts@example.com'
	  fill_in 'password',                    with: 'pw'
	  fill_in 'form_sales_family_name',      with: 'test'
	  fill_in 'form_saels_given_name',       with: 'takashi'
	  fill_in 'form_sales_family_name_kana', with: 'taka'
	  fill_in 'form_sales_given_name_kana',  with: 'takako'
	  fill_in 'birthday',                    with: '1999-01-01'
	  choose 'female'
	  check 'input home addr'
	  within('fieldset#home-address-fields') do
	    fill_in 'postal_code', with: '1000000'
	    select 'osaka',        with: 'prefecture'
	    fill_in 'city',        with: 'ofukatyo'
	    fill_in 'address1',    with: '1-1'
	    fill_in 'address2',    with: '101'
	  end
	  check 'input work addr'
	  within('fieldset#work-address-fields') do
            fill_in 'company',     with: 'test'
	    fill_in 'division',    with: ''
	    fill_in 'postal_code', with: ''
	    select  'osaka',       from: 'prefecture'
	    fill_in 'city',        with: 'ofukatyo'
	    fill_in 'address1',    with: '1-1'
	    fill_in 'address2',    with: '101'
	  end
	  click_button 'ENTER'

	  new_sales = Sales.order(:id).last
	  expect(new_sales.eamil).to     eq('test@example.com')
	  expect(new_sales.birthday).to  eq(Date.new(1980, 1, 1))
	  expect(new_sales.gender).to    eq('female')
	  expect(new_sales.home_address.postal_code).to   eq('1000000')
	  expect(new_sales.work_address.company_name).to  eq('test')
	end

        scenario 'cost sales,home&work addr, update' do
	  click_link 'sales management'
	  first('table.lisitng').click_link 'edit'

	  fill_in 'E-mail',      with: 'test@example.com'
	  within('fieldset#home-address-fields') do
		  fill_in 'postal_code',  with: '0000000'
	  end
	  within('fieldset#work-address-fields') do
		  fill_in 'company_name', with: 'test'
	  end
	  click_button 'update'

	  sales.reload
	  expect(sales.email).to                     eq('test@example.com')
	  expect(sales.home_address.postal_code).to  eq('9999999')
	  expect(sales.work_address.company_name).to eq('test')
	end

expect(page).to have_css(
  'div.fireld_with_errors input#form_home_address_postal_code')
end

scenario 'cost sales_info add' do
  sales.work address.destroy
  click link 'sales management'
  first('table.listing').click_link 'more'

  check 'work_address input'
  within('fieldset#work-address-fields') do
    fill_in 'company_name', with: 'test'
end










      scenario 'cost birthday home addr invalidate' do
	click_link 'sales management'
	frirst('table.listing').click_link 'edit'

	fill_in 'birthday',    with: '1994-03-23'
	within('fieldset#home-address-fields') do
	  fill_in 'postal_code', with: 'XYZ'
	end
	click_button 'update'

	expect(page).to have_css('header span.alert')
	expect(page).to have_css(
		'div.field_with_errors input#form_sales_birthday')
	expect(page).to have_css(
		'div.field_with_errors input#form_home_address_postal_code')
	end
end


