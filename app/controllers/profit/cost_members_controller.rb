class Admin::CostMembersController < Profit::Base
def index
	@cost_members = CostMember.order(:family_name_kana, :given_name_kana)
		.page(params[:page])
end

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

end

