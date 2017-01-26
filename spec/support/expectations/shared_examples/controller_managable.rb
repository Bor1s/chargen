RSpec.shared_examples 'controller_managable' do |new_sheet_route, system, params|
  let(:sheet) { FactoryGirl.create(system, user: user) }

  context system.to_s do
    describe "GET ##{system}" do
      it "returns http success" do
        get new_sheet_route
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST #create" do
      it "returns http success" do
        post :create, params: { system: sheet.class::SYSTEM_NAME, character_sheet: params }
        expect(response).to redirect_to edit_character_sheet_path(CharacterSheet.last)
      end

      it "renders new page" do
        allow_any_instance_of(sheet.class).to receive(:save).and_return(false)
        post :create, params: { system: sheet.class::SYSTEM_NAME, character_sheet: params }
        expect(response).to have_http_status(:success)
      end
    end

    describe "PUT #update" do
      it 'updates character sheet' do
        params[params.keys.first] = 'UPDATED'
        put :update, params: { id: sheet.id, system: sheet.class::SYSTEM_NAME, character_sheet: params }
        expect(user.character_sheets.first.attributes).to eq sheet.reload.attributes
      end
    end
  end
end
