class InvitationsController < BaseController
  before_filter :get_resources

  def show
    @inviter = @invitation.inviter
  end

  private

  def get_resources
    @group = Group.find(params[:group_id])
    @invitation = Invitation.where(:group_id => params[:group_id],
                                  :token => params[:id]).first
    unless @invitation
      redirect_to group_url(@group)
    end
  end
end
