class CharacterSheets::HeroQuest< CharacterSheet

  SYSTEM_NAME = 'hero_quest'
  HUMAN_SYSTEM_NAME = 'Hero Quest'
  ABILITIES = 15
  FLAWS = 3
  BENEFITS = 12
  FIELDS_MAP = [
    character_name: "character_name",
    game_name: "game_name",
    player_name: "player_name",
    description: "description",
    ability_num1: "ability_num1",
    ability_num2: "ability_num2",
    ability_num3: "ability_num3",
    ability_num4: "ability_num4",
    ability_num5: "ability_num5",
    ability_num6: "ability_num6",
    ability_num7: "ability_num7",
    ability_num8: "ability_num8",
    ability_num9: "ability_num9",
    ability_num10: "ability_num10",
    ability_num11: "ability_num11",
    ability_num12: "ability_num12",
    ability_num13: "ability_num13",
    ability_num14: "ability_num14",
    ability_num15: "ability_num15",
    ability1: "ability1",
    ability2: "ability2",
    ability3: "ability3",
    ability4: "ability4",
    ability5: "ability5",
    ability6: "ability6",
    ability7: "ability7",
    ability8: "ability8",
    ability9: "ability9",
    ability10: "ability10",
    ability11: "ability11",
    ability12: "ability12",
    ability13: "ability13",
    ability14: "ability14",
    ability15: "ability15",
    flaw1: "flaw1",
    flaw2: "flaw2",
    flaw3: "flaw3",
    flaw_num1: "flaw_num1",
    flaw_num2: "flaw_num2",
    flaw_num3: "flaw_num3",
    hero_points: "hero_points",
    benefit_num1: "benefit_num1",
    benefit_num2: "benefit_num2",
    benefit_num3: "benefit_num3",
    benefit_num4: "benefit_num4",
    benefit_num5: "benefit_num5",
    benefit_num6: "benefit_num6",
    benefit_num7: "benefit_num7",
    benefit_num8: "benefit_num8",
    benefit_num9: "benefit_num9",
    benefit_num10: "benefit_num10",
    benefit_num11: "benefit_num11",
    benefit_num12: "benefit_num12",
    benefit1: "benefit1",
    benefit2: "benefit2",
    benefit3: "benefit3",
    benefit4: "benefit4",
    benefit5: "benefit5",
    benefit6: "benefit6",
    benefit7: "benefit7",
    benefit8: "benefit8",
    benefit9: "benefit9",
    benefit10: "benefit10",
    benefit11: "benefit11",
    benefit12: "benefit12",
    notes: "notes"
  ]

  store_accessor :data_fields, *FIELDS_MAP.first.keys

  def hero_points=(amount)
    super(amount.to_i)
  end

  def hero_points
    super.to_i
  end
end
