class CharacterSheet < ApplicationRecord
  store :data_fields, coder: JSON

  has_one :shareable_link, dependent: :destroy
  belongs_to :user, optional: true
end
