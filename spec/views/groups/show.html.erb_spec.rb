require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  before(:each) do
    @user = User.create(name: 'lex', email: 'mail@mail.ru', password: 'password', password_confirmation: 'password')
    @group = Group.create(name: 'Group', icon: 'access_alarms')
    @budget1 = Budget.create(name: 'Transaction', amount: 100)
    @budget2 = Budget.create(name: 'Transaction2', amount: 100)
  end

  scenario 'when the user access the group page, they are presented with the group name, and total amount' do
    visit group_path(@group)
    expect(page).to have_content @group.name
    expect(page).to have_content @group.budgets.sum(:amount).round(2)
  end

  scenario 'for each budget, user can see name, amount, and date that belongs to a group' do
    visit group_path(@group)
    @group.budgets.each do |budget|
      expect(page).to have_content budget.name
      expect(page).to have_content budget.amount
      expect(page).to have_content budget.date
    end
  end

  scenario 'there is an "Add a new Budget" button' do
    visit group_path(@group)
    click_link 'Add a new Budget'
    expect(page).to have_current_path(new_group_budget_path(@group))
  end
end
