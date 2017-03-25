class CharacterSheets::Gurps < CharacterSheet
  SYSTEM_NAME = 'gurps'
  HUMAN_SYSTEM_NAME = 'GURPS'

  store_accessor :data_fields, *fields_map.keys

  # def to_partial_path
  #   'character_sheets/gurpses/gurps'
  # end
end
