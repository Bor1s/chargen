require 'rails_helper'

RSpec.describe CharacterSheets::Gurps, type: :model do
  let(:gurps) { FactoryGirl.create(:gurps_sheet) }

  it { expect(gurps.class::SYSTEM_NAME).to eq 'gurps' }
  it { expect(gurps.class::HUMAN_SYSTEM_NAME).to eq 'GURPS' }
  it { expect(gurps.class.fields_map.size).to eq 561 }
end

