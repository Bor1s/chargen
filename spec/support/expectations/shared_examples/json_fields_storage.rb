RSpec.shared_examples 'json_fields_storage' do |system|
  let(:sheet) { FactoryGirl.create(system) }

  it 'has all keys as accessors' do
    sheet.class.fields_map.each do |key, _|
      expect(sheet).to respond_to(key)
    end
  end

  it 'assigns and reads custom keys properly' do
    sheet.data_fields['PlayerName'] = 'Boris'
    expect(sheet.data_fields['PlayerName']).to eq 'Boris'
  end
end
