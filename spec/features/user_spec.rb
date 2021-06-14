require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before :each do
    @user1 = User.create(username: 'kamila', fullname: 'Camela Jones')
    @user2 = User.create(username: 'great', fullname: 'Deep Water')
    visit '/sign_in'
    fill_in 'session_username', with: 'kamila'
    click_button 'Login'
  end

  it 'the user posts in the home page' do
    visit 'sign_in'

    fill_in 'session_username', with: 'kamila'
    click_button 'Login'

    expect(page).to have_text('')
  end

  it 'following users are shown in home page' do
    visit 'sign_in'

    fill_in 'session_username', with: 'great'
    click_button 'Login'
  end

  it 'followers are shown in home page' do
    visit 'sign_in'

    fill_in 'session_username', with: 'great'
    click_button 'Login'
  end

  it 'should logout' do
    click_button 'Login'
    expect(current_path).to eql(sign_in_path)
  end
end
