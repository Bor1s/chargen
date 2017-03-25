require 'rails_helper'

RSpec.describe CharacterSheets::FateAccelerated, type: :model do
  let(:fae) { FactoryGirl.create(:fate_accelerated_sheet) }

  it { expect(fae.to_partial_path).to eq 'character_sheets/faes/fae' }
  it { expect(fae.class::SYSTEM_NAME).to eq 'fae' }
  it { expect(fae.class::HUMAN_SYSTEM_NAME).to eq 'Fate Accelerated' }

  it 'has 0 refresh by default' do
    expect(fae.refresh).to eq 0
  end

  it 'has 0 current_fate_points by default' do
    expect(fae.current_fate_points).to eq 0
  end
end

