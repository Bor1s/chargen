require 'rails_helper'

describe 'creating character sheet', type: :feature, js: true do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as user, scope: :user
  end

  it 'leads me to system selections page' do
    visit('/')
    click_link 'New Character'
    expect(page).to have_content 'Choose wisely!'
  end

  context 'Hero Quest' do
    it 'leads me to new sheet page' do
      visit('/character_sheets/new/hero_quest')
      expect(page).to have_css 'form#new_character_sheet'
    end

    it 'has system hidden field' do
      visit('/character_sheets/new/hero_quest')
      within 'form#new_character_sheet' do
        system_name = find('#system', visible: false).value
        expect(system_name).to eq 'hero_quest'
      end
    end

    it 'fills form and saves new sheet' do
      visit('/character_sheets/new/hero_quest')
      within 'form#new_character_sheet' do
        fill_in('Character', with: 'Frodo')
        fill_in('Game', with: 'Fall of Cormyr')
        fill_in('Player', with: 'Boris')
        click_button 'Create'
      end

      expect(page).to have_content('Character sheet has been created')
    end

    it 'fills form on existing sheet and saves it' do
      sheet = FactoryGirl.create(:hero_quest_sheet, user: user)
      visit("/character_sheets/#{sheet.id}/edit")

      within 'form#edit_character_sheet' do
        fill_in('Character', with: 'Frodo')
        fill_in('Game', with: 'Fall of Cormyr')
        fill_in('Player', with: 'Boris')
        click_button 'Update'
      end

      character_name = find('#character_sheet_character_name').value
      game_name = find('#character_sheet_game_name').value
      player_name = find('#character_sheet_player_name').value

      expect(page).to have_content('Character sheet has been updated')
      expect(character_name).to eq 'Frodo'
      expect(game_name).to eq 'Fall of Cormyr'
      expect(player_name).to eq 'Boris'
    end
  end
end
