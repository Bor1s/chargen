class CharacterSheets::Null
  SYSTEM_NAME = 'null'

  def initialize(params)
  end

  def self.stored_attributes
    { data_fields: [] }
  end
end
