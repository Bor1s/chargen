class CharacterSheets::FateCore < CharacterSheet
  SYSTEM_NAME = 'fate'
  HUMAN_SYSTEM_NAME = 'Fate Core'
  SKILLS = [:superb, :great, :good, :fair, :average]
  FIELDS_MAP = [
    name:                 'Name',
    description:          'Description',
    refresh:              'Refresh',
    high_concept:         'High Concept',
    trouble:              'Trouble',
    first_adventure:      'undefined_8',
    crossing_path_1:      'undefined_13',
    crossing_path_2:      'undefined_18',
    superb_1:             'Superb 5',
    superb_2:             'undefined',
    superb_3:             'CORE SYSTEM',
    superb_4:             'undefined_2',
    superb_5:             'undefined_3',
    great_1:              'Great 4',
    great_2:              'undefined_4',
    great_3:              'undefined_5',
    great_4:              'undefined_6',
    great_5:              'undefined_7',
    good_1:               'Good 3',
    good_2:               'undefined_9',
    good_3:               'undefined_10',
    good_4:               'undefined_11',
    good_5:               'undefined_12',
    fair_1:               'Fair 2',
    fair_2:               'undefined_14',
    fair_3:               'undefined_15',
    fair_4:               'undefined_16',
    fair_5:               'undefined_17',
    average_1:            'Average 1',
    average_2:            'undefined_19',
    average_3:            'undefined_20',
    average_4:            'undefined_21',
    average_5:            'undefined_22',
    extras:               'EXTRAS',
    stunts:               'STUNTS',
    mild_consequence_1:   'Mild',
    mild_consequence_2:   'Mild_2',
    moderate_consequence: 'Moderate',
    severe_consequence:   'Severe'
  ]

  store_accessor :data_fields, *FIELDS_MAP.first.keys
end
