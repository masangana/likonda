require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  before(:example) do
    @user = User.create(name: 'John Doe', email: 'john@mail.com', password: '123456', password_confirmation: '123456')
    visit '/login'
    fill_in 'user_email', with: 'john@mail.com'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'

    @group = Group.new(name: 'Group 1', icon: 'account_balance', user_id: @user.id)
    @group2 = Group.new(name: 'Group 2', icon: 'account_balance', user_id: @user.id)

    visit "/groups/#{@group.id}"
  end

  describe 'Display one group' do
    it 'returns correct response status' do
      expect(page).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(page).to have_current_path("/groups/#{@group.id}")
    end
  end
end
