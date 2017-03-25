class CharacterSheet < ApplicationRecord
  store :data_fields, coder: JSON

  has_one :shareable_link, dependent: :destroy
  belongs_to :user, optional: true

  def self.system_fields_file_storage_name
    if const_defined?(:SYSTEM_NAME)
      "#{self::SYSTEM_NAME}.yml"
    else
      ""
    end
  end

  def self.fields_map
    field_mappings_path = Rails.root.join('config', 'field_mappings', system_fields_file_storage_name)
    return {} unless File.exists?(field_mappings_path)
    @fields_map ||= YAML.load(File.read(field_mappings_path))
  end
end
