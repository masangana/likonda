class GroupsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @groups = Group.all.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    
    # rubocop:disable Layout/LineLength
    @icons = %w[album all_inclusive all_out android announcement apps archive arrow_back arrow_downward arrow_drop_down arrow_drop_down_circle arrow_drop_up arrow_forward arrow_upward art_track aspect_ratio assessment assignment assignment_ind assignment_late assignment_return assignment_returned assignment_turned_in assistant assistant_photo attach_file attach_money attachment audiotrack autorenew av_timer backspace backup battery_alert battery_charging_full ]
    # rubocop:enable Layout/LineLength
    @group = Group.new
  end

  def create

    @icons = %w[album all_inclusive all_out android announcement apps archive arrow_back arrow_downward arrow_drop_down arrow_drop_down_circle arrow_drop_up arrow_forward arrow_upward art_track aspect_ratio assessment assignment assignment_ind assignment_late assignment_return assignment_returned assignment_turned_in assistant assistant_photo attach_file attach_money attachment audiotrack autorenew av_timer backspace backup battery_alert battery_charging_full ]
    # rubocop:enable Layout/LineLength
    @user = current_user
    @group = Group.new(name: group_params[:name], icon: group_params[:icon], user_id: @user.id)
    #@group = current_user.groups.new(group_params)
    if @group.save
      flash[:success] = 'Group created!'
      redirect_to @group
    else
      render 'new'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:success] = 'Group deleted!'
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
