require 'rails_helper'

RSpec.describe CharacterSheetsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
  end

  it_behaves_like 'controller_managable', :fate, :fate_core_sheet, { name: 'foo' }
  it_behaves_like 'controller_managable', :hero_quest, :hero_quest_sheet, { character_name: 'foo' }
  it_behaves_like 'controller_managable', :fae, :fate_accelerated_sheet, { name: 'Elorn' }
  it_behaves_like 'controller_managable', :gurps, :gurps_sheet, { player: 'Elorn' }
end
