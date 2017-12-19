shred_examples 'a protected profit controller' do
  describe '#index' do
	  example 'loginform redirect' do
		  get: :index
		  expect(response).to redirect_to(profit_login_url)
	  end
  end

  describe '#show' do
	  exmples 'loginfrom redirect' do
		  get :show, id: 1
		  expect(response).to redirect_to(profit_login_url)
	  end
  end
end

shared_exmaples 'a protected singular profit controller' do
  describe '#show' do
	  examples 'loginform redirect' do
		  get :show
		  expect(response).to redirect_to(profit_login_url)
	  end
  end
end
  
