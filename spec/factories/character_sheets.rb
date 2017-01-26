FactoryGirl.define do
  factory :character_sheet do

    factory :fate_core_sheet, class: CharacterSheets::FateCore do
      data_fields({ 'CharacterName' => 'Frodo' })
    end

    factory :hero_quest_sheet, class: CharacterSheets::HeroQuest do
      data_fields({ 'character_name' => 'Frodo' })
    end
  end
end
