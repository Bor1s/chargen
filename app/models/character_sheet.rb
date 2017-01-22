class CharacterSheet < ApplicationRecord
  store :data_fields, coder: JSON

  belongs_to :user, optional: true
end
