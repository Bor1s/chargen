FactoryGirl.define do
  factory :character_sheet do

    factory :fate_core_sheet, class: CharacterSheets::FateCore do
      data_fields({ 'CharacterName' => 'Frodo' })
    end
  end
end
