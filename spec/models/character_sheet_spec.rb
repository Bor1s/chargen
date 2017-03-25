require 'rails_helper'

RSpec.describe CharacterSheet, type: :model do
  describe 'store' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one(:shareable_link) }

    it_behaves_like 'json_fields_storage', :fate_core_sheet
    it_behaves_like 'json_fields_storage', :hero_quest_sheet
  end
end
