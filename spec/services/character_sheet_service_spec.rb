require 'rails_helper'

RSpec.describe CharacterSheetService, type: :service do

  describe '#export_to_pdf!' do
    let(:fate_core_sheet) { FactoryGirl.create(:fate_core_sheet) }
    let(:unexisting_sheet) { FactoryGirl.create(:character_sheet) }
    subject { described_class.new(fate_core_sheet) }

    describe 'creating PDF' do
      it 'creates PDF file' do
        expect(subject.export_to_pdf!).to make_pdf_file(subject.pdf_path)
      end

      it 'raises NoTemplateError' do
        expect { described_class.new(unexisting_sheet) }.to raise_error(CharacterSheetService::NoTemplateError)
      end
    end
  end
end
