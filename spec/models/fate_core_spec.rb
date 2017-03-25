require 'rails_helper'

RSpec.describe CharacterSheets::FateCore, type: :model do
  let(:fate_core) { FactoryGirl.create(:fate_core_sheet) }

  it { expect(fate_core.class::SYSTEM_NAME).to eq 'fate' }
  it { expect(fate_core.class::HUMAN_SYSTEM_NAME).to eq 'Fate Core' }
  it { expect(fate_core.class::SKILLS).to eq [:superb, :great, :good, :fair, :average] }

  it 'has 0 refresh by default' do
    expect(fate_core.refresh).to eq 0
  end
end
