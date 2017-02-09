class CharacterSheets::FateCore < CharacterSheet
  SYSTEM_NAME = 'fate'
  HUMAN_SYSTEM_NAME = 'Fate Core'
  SKILLS = [:superb, :great, :good, :fair, :average]
  FIELDS_MAP = [
    name:                 'Name',
    description:          'Description',
    refresh:              'Refresh',
    high_concept:         'high_concept',
    trouble:              'Trouble',
    first_adventure:      'undefined_8',
    crossing_path_1:      'undefined_13',
    crossing_path_2:      'undefined_18',
    superb_1:             'superb1',
    superb_2:             'superb2',
    superb_3:             'superb3',
    superb_4:             'superb4',
    superb_5:             'superb5',
    great_1:              'great1',
    great_2:              'great2',
    great_3:              'great3',
    great_4:              'great4',
    great_5:              'great5',
    good_1:               'good1',
    good_2:               'good2',
    good_3:               'good3',
    good_4:               'good4',
    good_5:               'good5',
    fair_1:               'fair1',
    fair_2:               'fair2',
    fair_3:               'fair3',
    fair_4:               'fair4',
    fair_5:               'fair5',
    average_1:            'average1',
    average_2:            'average2',
    average_3:            'average3',
    average_4:            'average4',
    average_5:            'average5',
    extras:               'EXTRAS',
    stunts:               'STUNTS',
    mild_consequence_1:   'Mild',
    mild_consequence_2:   'Mild_2',
    moderate_consequence: 'Moderate',
    severe_consequence:   'Severe'
  ]

  store_accessor :data_fields, *FIELDS_MAP.first.keys
end
