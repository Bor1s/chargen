require 'rails_helper'

RSpec.describe PdfMetaService, type: :service do
  subject { described_class.new(character_sheet) }

  context 'for Fate Core' do
    it_behaves_like 'pdf metable', { sheet: :fate_core_sheet, system: 'fate'}
  end

  context 'for Fate Accelerated' do
    it_behaves_like 'pdf metable', { sheet: :fate_accelerated_sheet, system: 'fae'}
  end

  context 'for Hero Quest' do
    it_behaves_like 'pdf metable', { sheet: :hero_quest_sheet, system: 'hero_quest'}
  end

  context 'for GURPS' do
    it_behaves_like 'pdf metable', { sheet: :gurps_sheet, system: 'gurps'}
  end
end
