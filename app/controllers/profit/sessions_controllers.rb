
def new
if current_administrator
redirect_to :profit_root
else
	@form = Profit::LoginForm.new
	render action:'new'
end
end

