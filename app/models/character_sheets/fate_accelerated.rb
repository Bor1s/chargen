class CharacterSheets::FateAccelerated < CharacterSheet
  SYSTEM_NAME = 'fae'
  HUMAN_SYSTEM_NAME = 'Fate Accelerated'
  FIELDS_MAP = [
    description: 'description',
    current_fate_points: 'current_fate_points',
    name: 'name',
    trouble: 'trouble',
    high_concept: 'high_concept',
    aspect3: 'aspect3',
    aspect4: 'aspect4',
    aspect5: 'aspect5',
    refresh: 'refresh',
    careful: 'careful',
    clever: 'clever',
    flashy: 'flashy',
    quick: 'quick',
    forceful: 'forceful',
    sneaky: 'sneaky',
    stunts: 'stunts',
    moderate: 'moderate',
    mild: 'mild',
    severe: 'severe'
  ]

  store_accessor :data_fields, *FIELDS_MAP.first.keys

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
