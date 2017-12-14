
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

