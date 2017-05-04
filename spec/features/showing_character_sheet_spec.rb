require 'rails_helper'

describe 'showing character sheet', type: :feature, js: true do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as user, scope: :user
  end

  context 'when shows' do
    context 'Hero Quest sheet' do
      before do
        sheet = FactoryGirl.create(:hero_quest_sheet, user: user)
        visit("/character_sheets/#{sheet.id}")
      end

      it 'renders logo and manage buttons topbar' do
        expect(page).to have_css('.row.align-items-center')
      end

      it 'renders manage buttons footer' do
        expect(page).to have_css('#footer-manage-buttons')
      end
    end

    context 'GURPS sheet' do
      before do
        sheet = FactoryGirl.create(:gurps_sheet, user: user)
        visit("/character_sheets/#{sheet.id}")
      end

      it 'renders quick navigation topbar' do
        expect(page).to have_css('.row.sticky-menu')
      end

      it 'renders logo and manage buttons topbar' do
        expect(page).to have_css('.row.align-items-center')
      end

      it 'renders manage buttons footer' do
        expect(page).to have_css('#footer-manage-buttons')
      end

      context 'sections' do
        it 'contains #basics' do
          expect(page).to have_css('fieldset#basics')
        end

        it 'contains #stats' do
          expect(page).to have_css('fieldset#stats')
        end

        it 'contains #movement_and_damage' do
          expect(page).to have_css('fieldset#movement_and_damage')
        end

        it 'contains #encumbrance' do
          expect(page).to have_css('fieldset#encumbrance')
        end

        it 'contains #move' do
          expect(page).to have_css('fieldset#move')
        end

        it 'contains #dodge' do
          expect(page).to have_css('fieldset#dodge')
        end

        it 'contains #languages' do
          expect(page).to have_css('fieldset#languages')
        end

        it 'contains #dr' do
          expect(page).to have_css('fieldset#dr')
        end

        it 'contains #tl' do
          expect(page).to have_css('fieldset#tl')
        end

        it 'contains #cultural_familiarities' do
          expect(page).to have_css('fieldset#cultural_familiarities')
        end

        it 'contains #parry' do
          expect(page).to have_css('fieldset#parry')
        end

        it 'contains #block' do
          expect(page).to have_css('fieldset#block')
        end

        it 'contains #reaction_modifiers' do
          expect(page).to have_css('fieldset#reaction_modifiers')
        end

        it 'contains #advantages' do
          expect(page).to have_css('fieldset#advantages')
        end

        it 'contains #disadvantages' do
          expect(page).to have_css('fieldset#disadvantages')
        end

        it 'contains #skills' do
          expect(page).to have_css('fieldset#skills')
        end

        it 'contains #hand_weapons' do
          expect(page).to have_css('fieldset#hand_weapons')
        end

        it 'contains #ranged_weapons' do
          expect(page).to have_css('fieldset#ranged_weapons')
        end

        it 'contains #armor_and_posessions' do
          expect(page).to have_css('fieldset#armor_and_posessions')
        end

        it 'contains #notes' do
          expect(page).to have_css('fieldset#notes')
        end

        it 'contains #points' do
          expect(page).to have_css('fieldset#points')
        end
      end
    end
  end
end
