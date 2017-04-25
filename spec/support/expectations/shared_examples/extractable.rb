RSpec.shared_examples 'extractable' do |params|
  let(:character_sheet) { FactoryGirl.create(params[:sheet]) }

  it 'returns data' do
    expect(subject.extract).to include(params[:data])
  end
end
