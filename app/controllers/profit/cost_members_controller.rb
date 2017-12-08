def destroy
	cost_member = CostMember.find(params[:id])
	if cost_member.deletable?
		staff_member.destroy!
		flash.notice = 'Deleted Cost Accounts'
	else
		flash.alert = 'not delete thi cost accunts'
	end
	redirect_to :profit_cost_members
end

