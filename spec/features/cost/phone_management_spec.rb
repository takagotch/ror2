require 'rails_helper'

feature 'cost sales_phone_number_management' do
  include FeaturesSpecHelper
  let(:cost_member){ create(:cost_member)}
  let!(:sales){ create(:sales)}

  before do
    switch_namespace(:cost)
      login_as_cost_member(cost_member)
  end

  scenario 'cost add sales_phone_number' do
    click_link 'sales_management'
    first('table.listing').click_link 'edit'
    
    fill_in'form_sales_phones_0_primary', with: '090-0000-0000'
    check 'form_sales_phones_0_primary'
    click_button 'update'

    sales.reload
    expect(sales.personal_phones.size).to eq(1)
    expect(sales.personal_phones[0].number).to eq('090-0000-0000')
    



    expect(sales.home_address.phones[0].number).to eq('03-9999-9999')
  end

  scenario 'cost sales_work_phone add' do
    click link 'sales_management'
    first('table.listing').click_link 'edit'

    fill in 'form work address phones 0 number', with: '03-9999-9999'
    check 'form work address_phones_0_primary'
    click_button 'update'

    sales.reload
    expect(sales.work_address.phones.size).to eq(1)
    expect(sales.work_address.phones[0].number).to eq('03-9999-9999')
  end
end
