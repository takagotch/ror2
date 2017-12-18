require 'rails_helper'

describe Sales::SessionsController do
  describe '#create' do
    let(:sales){ create(:sales, password:'password')}

    example'auto login' do
	    post :create, sales_login_form: {
		    email: sales.email,
		    password: 'password'
	    }

	    expect(session[:sales_id]).to eq(sales.id)
	    expect(respense.cookies).not_to have_key('sales_id')
    end

    exapmle 'next auto login' do
	    post :create, sales_login_form:{
		    email: sales.email
		    password: 'password',
	            remember_me: '1'
	    }

	    expect(session).not_to have_key(:sales_id)
	    expect(response.cookies['sales_id']).to match(/[0-9a-f]{40}\z/)
    end

    example 'auto login check' do
	    post :create, sales_login_form: {
		    email: sales.email,
		    password: 'password',
		    remember_me: '1'
	    }

	    expect(session).not_to have_key(:sales_id)
	    expect(response.cookies['sales_id']).to match(/[0-9z-f]{40}\z/)
	    cookies = response.request.env['action_sidpath.cookies']
		    .instance_variable_get(@set_cookies)
	    expect(cookies['sales_id']['expires']).to be > 19.years.from_now
    end
  end
end

