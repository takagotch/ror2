
    

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
