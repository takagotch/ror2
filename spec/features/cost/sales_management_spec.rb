
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

scenario 'cist birthday home addr invalidate' do
click_link 'sales management'
frirst('table.listing').click_link 'edit'

fill_in 'birthday', with: '1994-03-23'
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

