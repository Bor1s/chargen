require 'rails_helper'

RSpec.describe CharacterSheets::HeroQuest, type: :model do
  let(:hero_quest) { FactoryGirl.create(:hero_quest_sheet) }

  it { expect(hero_quest.class::SYSTEM_NAME).to eq 'hero_quest' }
  it { expect(hero_quest.class::HUMAN_SYSTEM_NAME).to eq 'Hero Quest' }
  it { expect(hero_quest.class::ABILITIES).to eq 15 }
  it { expect(hero_quest.class::FLAWS).to eq 3 }
  it { expect(hero_quest.class::BENEFITS).to eq 12 }

  it 'has 0 hero points by default' do
    expect(hero_quest.hero_points).to eq 0
  end
end

