class CharacterSheets::FateCore < CharacterSheet
  SYSTEM_NAME = 'fate'
  HUMAN_SYSTEM_NAME = 'Fate Core'
  SKILLS = [:superb, :great, :good, :fair, :average]

  store_accessor :data_fields, *fields_map.keys

  def refresh=(amount)
    super(amount.to_i)
  end

  def refresh
    super.to_i
  end
end
