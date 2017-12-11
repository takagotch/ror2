def edit
	@cost_member = current_cost_member
end

def confirm
@cost_member = current_cost_member
@cost_member.assign_attributes(cost_member_params)
if @cost_member.valid?
	render action: 'confirm'
else
	render action: 'edit'
end

def update
@cost_member = current_cost_member
@cost_member.assign_attributes(cost_member_params)
if params[:commit]
	if @cost_member.save
		flash.notice = 'update account info'
		redirect_to :cost_account
        else
	        render action: 'edit'
        end
else
	render action: 'edit'
end
end

end

