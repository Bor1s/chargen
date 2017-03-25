class CharacterSheets::FateAccelerated < CharacterSheet
  SYSTEM_NAME = 'fae'
  HUMAN_SYSTEM_NAME = 'Fate Accelerated'
  store_accessor :data_fields, *fields_map.keys

  def to_partial_path
    'character_sheets/faes/fae'
  end

  def refresh=(amount)
    super(amount.to_i)
  end

  def refresh
    super.to_i
  end

  def current_fate_points=(amount)
    super(amount.to_i)
  end

  def current_fate_points
    super.to_i
  end
end
