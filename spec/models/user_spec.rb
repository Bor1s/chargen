require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to have_many(:character_sheets) }
  it { is_expected.to have_many(:fate_core_character_sheets) }
  it { is_expected.to have_many(:fate_accelerated_character_sheets) }
  it { is_expected.to have_many(:hero_quest_character_sheets) }
  it { is_expected.to have_many(:gurps_character_sheets) }
end
