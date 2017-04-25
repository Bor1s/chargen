require 'rails_helper'

RSpec.describe PdfExporterService, type: :service do
  describe '#export' do
    subject { described_class.new(data, character_sheet) }

    context 'for Fate Core' do
      it_behaves_like 'exportable', { sheet: :fate_core_sheet, data: ['name Frodo'] }
    end

    context 'for Fate Accelerated' do
      it_behaves_like 'exportable', { sheet: :fate_accelerated_sheet, data: ['name Frodo'] }
    end

    context 'for HeroQuest' do
      it_behaves_like 'exportable', { sheet: :hero_quest_sheet, data: ['character_name Frodo'] }
    end

    context 'for GURPS' do
      it_behaves_like 'exportable', { sheet: :gurps_sheet, data: ['player Frodo'] }
    end
  end
end
