require 'rails_helper'

RSpec.describe ShareableLinksHelper, type: :helper do
  let(:character_sheet) { FactoryGirl.create(:fate_core_sheet, :with_shareable_link) }
  let(:character_sheet_with_no_share) { FactoryGirl.create(:fate_core_sheet) }

  it 'returns share_link' do
    expect(helper.share_link(character_sheet)).to start_with('http://')
  end

  it 'returns I18n message' do
    expect(helper.share_link(character_sheet_with_no_share)).to eq t('helpers.no_link')
  end
end
