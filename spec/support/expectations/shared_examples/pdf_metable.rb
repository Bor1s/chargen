RSpec.shared_examples 'pdf metable' do |params|
  let(:character_sheet) { FactoryGirl.create(params[:sheet]) }

  describe '#template_path' do
    it 'is a Pathname instance' do
      expect(subject.template_path).to be_a(Pathname)
    end

    it 'returns path to pdf template' do
      expect(subject.template_path.to_s).to end_with("/tmp/pdf_templates/#{params[:system]}.pdf")
    end
  end

  describe '#fields_path' do
    it 'is a Pathname instance' do
      expect(subject.fields_path).to be_a(Pathname)
    end

    it 'returns path to a fields txt file' do
      allow(SecureRandom).to receive(:hex).with(8).and_return(777)
      expect(subject.fields_path.to_s).to end_with("/tmp/downloads/#{params[:system]}_777_fields.txt")
    end
  end

  describe '#output_pdf' do
    it 'is a Pathname instance' do
      expect(subject.output_pdf).to be_a(Pathname)
    end

    it 'returns path to a resulting pdf file' do
      allow(SecureRandom).to receive(:hex).with(8).and_return(777)
      expect(subject.output_pdf.to_s).to end_with("/tmp/downloads/#{params[:system]}_777.pdf")
    end
  end
end
