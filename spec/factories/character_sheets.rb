FactoryGirl.define do
  factory :character_sheet do

    factory :fate_core_sheet, class: CharacterSheets::FateCore do
      data_fields({ 'name' => 'Frodo' })
    end

    factory :fate_accelerated_sheet, class: CharacterSheets::FateAccelerated do
      data_fields({ 'name' => 'Frodo' })
    end

    factory :hero_quest_sheet, class: CharacterSheets::HeroQuest do
      data_fields({ 'character_name' => 'Frodo' })
    end

    factory :gurps_sheet, class: CharacterSheets::Gurps do
      data_fields({ 'player' => 'Frodo' })
    end

    factory :unexisting_sheet, class: Object do
      after(:build) do |sheet|
        sheet.class.const_set(:SYSTEM_NAME, '')
      end
    end

    trait(:with_shareable_link) do
      after(:build) do |sheet|
        sheet.shareable_link = ShareableLink.new(token: SecureRandom.hex(8))
      end
    end
  end
end
