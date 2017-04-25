RSpec.shared_examples 'exportable_sheet' do |params|
  let(:character_sheet) { FactoryGirl.create(params[:sheet]) }

  describe '#export' do
    it 'returns true' do
      pdf_meta = instance_double(PdfMetaService)
      allow(pdf_meta).to receive(:output_pdf).and_return('tmp/generated.pdf')
      pdf_exporter = instance_double(PdfExporterService)
      allow(pdf_exporter).to receive(:pdf_meta).and_return(pdf_meta)
      subject.exporter = pdf_exporter

      expect(pdf_exporter).to receive(:export).and_return(true)
      expect(subject.export).to eq true
    end

    it 'returns false' do
      pdf_meta = instance_double(PdfMetaService)
      allow(pdf_meta).to receive(:output_pdf).and_return(nil)
      pdf_exporter = instance_double(PdfExporterService)
      allow(pdf_exporter).to receive(:pdf_meta).and_return(pdf_meta)
      subject.exporter = pdf_exporter

      expect(pdf_exporter).to receive(:export).and_return(false)
      expect(subject.export).to eq false
    end
  end
end
