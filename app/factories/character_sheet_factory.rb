class CharacterSheetFactory
  class << self

    def build(system, character_sheet_params)
      factory = extract_character_sheet_factory(system)
      factory.new(character_sheet_params)
    end

    private

    def extract_character_sheet_factory(factory_name)
      case factory_name
      when CharacterSheets::FateCore::SYSTEM_NAME
        CharacterSheets::FateCore
      when CharacterSheets::HeroQuest::SYSTEM_NAME
        CharacterSheets::HeroQuest
      else
        CharacterSheets::Null
      end
    end
  end
end
