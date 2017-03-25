class CharacterSheets::HeroQuest < CharacterSheet
  SYSTEM_NAME = 'hero_quest'
  HUMAN_SYSTEM_NAME = 'Hero Quest'
  ABILITIES = 15
  FLAWS = 3
  BENEFITS = 12

  store_accessor :data_fields, *fields_map.keys

  def hero_points=(amount)
    super(amount.to_i)
  end

  def hero_points
    super.to_i
  end
end
