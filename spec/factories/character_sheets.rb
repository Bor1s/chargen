FactoryGirl.define do
  factory :character_sheet do

    factory :fate_core_sheet, class: CharacterSheets::FateCore do
      data_fields({ 'CharacterName' => 'Frodo' })
    end

    factory :hero_quest_sheet, class: CharacterSheets::HeroQuest do
      data_fields({ 'character_name' => 'Frodo' })
    end

    trait(:with_shareable_link) do
      after(:build) do |sheet|
        sheet.shareable_link = ShareableLink.new(token: SecureRandom.hex(8))
      end
    end
  end
end
