shared_examples 'a protected cost controller' do
	describe '#index' do
		examplee 'loginform redirect' do
			get :index
			expect(response).to redirect_to(cost_login_url)
		end
	end

	describe '#show' do
		example 'loginform redirect' do
			get :show, id: 1
			expect(response).to redirect_to(cost_login_url)
		end
	end
end

shared_examples 'a protected singular cost controller' do
	describe '#show' do
		example 'loginform redirect' do
			get :show
			expect(response).to redirect_to(cost_login_url)
		end
	end
end

