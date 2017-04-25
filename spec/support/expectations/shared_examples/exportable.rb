RSpec.shared_examples 'exportable' do |params|
  let(:character_sheet) { FactoryGirl.create(params[:sheet]) }
  let(:data) { params[:data] }

  it 'writes fields txt file properly' do
    subject.export
    expect(File.read(subject.pdf_meta.fields_path)).to eq "#{params[:data].join}\n"
  end

  it 'returns true if pdf was generated' do
    allow(SafeShell).to receive(:execute?).and_return(true)
    subject.export
  end

  it 'returns false if pdf generation falied' do
    allow(SafeShell).to receive(:execute?).and_return(false)
    subject.export
  end
end
