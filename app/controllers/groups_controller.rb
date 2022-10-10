class GroupsController < ApplicationController
  def index
    @groups = Group.all.order(created_at: :desc)
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
    @icon = %w[3d_rotation ac_unit access_alarm access_alarms access_time accessibility accessible
      account_balance account_balance_wallet account_box account_circle adb add add_a_photo]
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = "Group created!"
      redirect_to @group
    else
      render 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
