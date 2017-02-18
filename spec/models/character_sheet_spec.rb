require 'rails_helper'

RSpec.describe CharacterSheet, type: :model do
  describe 'store' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one(:shareable_link) }

    it_behaves_like 'json_fields_storage', :fate_core_sheet
    it_behaves_like 'json_fields_storage', :hero_quest_sheet
  end

  describe 'HeroQuest' do
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

  describe 'FateCore' do
    let(:fate_core) { FactoryGirl.create(:fate_core_sheet) }

    it { expect(fate_core.class::SYSTEM_NAME).to eq 'fate' }
    it { expect(fate_core.class::HUMAN_SYSTEM_NAME).to eq 'Fate Core' }
    it { expect(fate_core.class::SKILLS).to eq [:superb, :great, :good, :fair, :average] }

    it 'has 0 refresh by default' do
      expect(fate_core.refresh).to eq 0
    end
  end

  describe 'FateAccelerated' do
    let(:fae) { FactoryGirl.create(:fate_accelerated_sheet) }

    it { expect(fae.to_partial_path).to eq 'character_sheets/faes/fae' }
    it { expect(fae.class::SYSTEM_NAME).to eq 'fae' }
    it { expect(fae.class::HUMAN_SYSTEM_NAME).to eq 'Fate Accelerated' }

    it 'has 0 refresh by default' do
      expect(fae.refresh).to eq 0
    end

    it 'has 0 current_fate_points by default' do
      expect(fae.current_fate_points).to eq 0
    end
  end
end
