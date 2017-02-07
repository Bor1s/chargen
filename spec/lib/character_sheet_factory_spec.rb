require 'rails_helper'

RSpec.describe CharacterSheetFactory, type: :lib do

  describe '.build' do
    it 'makes new fate core sheet instance' do
      expect(described_class.build(CharacterSheets::FateCore::SYSTEM_NAME, {}).class).to eq CharacterSheets::FateCore
    end

    it 'makes new hero quest sheet instance' do
      expect(described_class.build(CharacterSheets::HeroQuest::SYSTEM_NAME, {}).class).to eq CharacterSheets::HeroQuest
    end

    it 'makes new null object' do
      expect { described_class.build(nil, {}) }.to raise_error(NotImplementedError, 'CharacterSheets::Null is an abstract class and cannot be instantiated.')
    end
  end
end
