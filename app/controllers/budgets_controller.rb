class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all.includes([:user]).where(user_id: current_user.id).order(:name)
  end

  def show
    @budget = Budget.find(params[:id])
  end

  def new
    @budget = Budget.new
  end

  def create
    @user = current_user
    @budget = @user.budgets.new(budget_params)
    if @budget.save
      @group_budget = @budget.group_budgets.create(group_id: params[:group_id])
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
    params.permit(:name, :amount)
  end
end
