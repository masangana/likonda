class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all.includes([:user]).where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @budget = Budget.find(params[:id])
  end

  def new
    @groups = Group.all.where(user_id: current_user).order(:name)
    @budget = Budget.new
  end

  def create
    @groups = Group.all.where(user_id: current_user).order(:name)
    @budget = Budget.new(budget_params)
    @budget.user_id = current_user.id
    if @budget.save
      flash[:success] = 'Budget created!'
      redirect_to group_path(params[:group_id])
    else
      render 'new'
    end
  end

  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy
    flash[:success] = 'Budget deleted!'
    redirect_to group_path(params[:group_id])
  end

  private

  def budget_params
    params.permit(:name, :amount, :group_ids => [])
  end
end
