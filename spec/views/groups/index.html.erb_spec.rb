require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  before(:each) do
    @user = User.create(name: 'lex', email: 'mail@mail.ru', password: 'password', password_confirmation: 'password')
    @group = Group.create(name: 'Group', icon: 'access_alarms')
  end

  scenario 'When the user logs in, they are presented with the Groups page' do
    visit groups_path
    expect(page).to have_content 'Groups'
  end

  scenario 'For each category, user can see name, icon, and total amount that belongs to a Group' do
    visit groups_path
    @user.groups.each do |group|
      expect(page).to have_content group.name
      expect(first('img') { |img| img[:src] == group.icon }).to be_present
    end
  end

  scenario 'There is an "ADD GROUPE" button' do
    visit groups_path
    click_link 'Add Group'
    expect(page).to have_current_path(new_group_path)
  end
end
