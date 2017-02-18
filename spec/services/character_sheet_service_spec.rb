require 'rails_helper'

RSpec.describe CharacterSheetService, type: :service do

  describe '#export_to_pdf!' do
    let(:fate_core_sheet) { FactoryGirl.create(:fate_core_sheet, refresh: '0') }
    let(:fate_core_sheet_with_zero_numbers) { FactoryGirl.create(:fate_core_sheet, refresh: 0) }
    let(:fae_sheet) { FactoryGirl.create(:fate_accelerated_sheet, refresh: '0') }
    let(:fae_sheet_with_zero_numbers) { FactoryGirl.create(:fate_accelerated_sheet, refresh: 0) }
    let(:hero_quest_sheet) { FactoryGirl.create(:hero_quest_sheet, hero_points: '0') }
    let(:hero_quest_sheet_with_zero_numbers) { FactoryGirl.create(:hero_quest_sheet, hero_points: 0) }
    let(:unexisting_sheet) { FactoryGirl.create(:character_sheet) }


    describe 'creating PDF' do

      context 'for Fate Core' do
        subject { described_class.new(fate_core_sheet) }

        context 'with numbers as string' do
          it { expect(subject.export_to_pdf!).to make_pdf_file(subject.pdf_path) }
        end

        context 'with numbers as integer' do
          subject { described_class.new(fate_core_sheet_with_zero_numbers) }

          it { expect(subject.export_to_pdf!).to make_pdf_file(subject.pdf_path) }
        end
      end

      context 'for FAE' do
        subject { described_class.new(fae_sheet) }

        context 'with numbers as string' do
          it { expect(subject.export_to_pdf!).to make_pdf_file(subject.pdf_path) }
        end

        context 'with numbers as integer' do
          subject { described_class.new(fae_sheet_with_zero_numbers) }

          it { expect(subject.export_to_pdf!).to make_pdf_file(subject.pdf_path) }
        end
      end

      context 'for Hero Quest' do
        subject { described_class.new(hero_quest_sheet) }

        context 'with numbers as string' do
          it { expect(subject.export_to_pdf!).to make_pdf_file(subject.pdf_path) }
        end

        context 'with numbers as integer' do
          subject { described_class.new(hero_quest_sheet_with_zero_numbers) }

          it { expect(subject.export_to_pdf!).to make_pdf_file(subject.pdf_path) }
        end
      end


      it 'raises NoTemplateError' do
        expect { described_class.new(unexisting_sheet) }.to raise_error(CharacterSheetService::NoTemplateError)
      end
    end
  end
end
