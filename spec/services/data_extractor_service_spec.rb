require 'rails_helper'

RSpec.describe DataExtractorService, type: :service do
  describe '#extract' do
    subject { described_class.new(character_sheet) }

    context 'for Fate Core' do
      it_behaves_like 'extractable', { sheet: :fate_core_sheet, data: 'Name Frodo' }
    end

    context 'for Fate Accelerated' do
      it_behaves_like 'extractable', { sheet: :fate_accelerated_sheet, data: 'name Frodo' }
    end

    context 'for HeroQuest' do
      it_behaves_like 'extractable', { sheet: :hero_quest_sheet, data: 'character_name Frodo' }
    end

    context 'for GURPS' do
      it_behaves_like 'extractable', { sheet: :gurps_sheet, data: 'Player Frodo' }
    end
  end
end
