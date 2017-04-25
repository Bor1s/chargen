require 'rails_helper'

describe 'the signin process', type: :feature, js: true do
  let(:user) { FactoryGirl.create(:user) }

  it 'signs me in' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end

    click_button 'Log In'
    expect(page).to have_content 'Signed in successfully.'
  end
end
