require 'rails_helper'

RSpec.describe CharacterSheet, type: :model do
  describe 'store' do
    subject { FactoryGirl.create(:fate_core_sheet) }

    it 'has all keys as accessors' do
      CharacterSheets::FateCore::FIELDS_MAP.first.keys.each do |key|
        expect(subject).to respond_to(key)
      end
    end

    it 'assigns and reads custom keys properly' do
      subject.data_fields['PlayerName'] = 'Boris'
      expect(subject.data_fields['PlayerName']).to eq 'Boris'
    end
  end
end
