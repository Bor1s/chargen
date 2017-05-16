RSpec.shared_examples 'controller_managable' do |new_sheet_route, system, params|
  let(:sheet) { FactoryGirl.create(system, user: user) }

  context system.to_s do
    context 'when user signed in' do
      describe "GET ##{system}" do
        it "returns http success" do
          get new_sheet_route
          expect(response).to render_template(new_sheet_route)
        end
      end

      describe "POST #create" do
        it "returns http success" do
          post :create, params: { system: sheet.class::SYSTEM_NAME, character_sheet: params }
          expect(response).to redirect_to edit_character_sheet_path(CharacterSheet.last)
        end

        it "renders http success from 'new' page" do
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

      describe "GET #export" do
        context 'when success' do
          it 'renders PDF file' do
            allow_any_instance_of(CharacterSheetExportService).to receive(:output_pdf).and_return(Rails.root.join('spec','fixtures','default.pdf'))
            allow_any_instance_of(CharacterSheetExportService).to receive(:export).and_return(true)
            get :export, params: { id: sheet.id }
            expect(response.content_type).to eq 'application/pdf'
          end
        end

        context 'when failed' do
          it 'renders export_failed page' do
            allow_any_instance_of(CharacterSheetExportService).to receive(:export).and_return(false)
            get :export, params: { id: sheet.id }
            expect(response).to render_template(:export_failed)
          end
        end

        context 'with malicious request' do
          before do
            sign_out user
          end

          it 'renders malicious_request page' do
            get :export, params: { id: sheet.id }
            expect(response).to render_template(:malicious_request)
          end
        end
      end
    end

    context 'when user is not signed in' do
      before do
        sign_out user
      end

      it "returns success" do
        get new_sheet_route
        expect(response).to render_template(new_sheet_route)
      end
    end

    describe 'POST #export' do
      before do
        sign_out user
      end

      context 'when success' do
        it 'renders PDF file' do
          allow_any_instance_of(CharacterSheetExportService).to receive(:output_pdf).and_return(Rails.root.join('spec','fixtures','default.pdf'))
          allow_any_instance_of(CharacterSheetExportService).to receive(:export).and_return(true)
          data = Hash[params.keys.first, 'Frodo']
          post :export, params: { system: sheet.class::SYSTEM_NAME, character_sheet: data }
          expect(response.content_type).to eq 'application/pdf'
        end
      end

      context 'when failed' do
        it 'renders export_failed page' do
          allow_any_instance_of(CharacterSheetExportService).to receive(:export).and_return(false)
          data = Hash[params.keys.first, 'Frodo']
          post :export, params: { system: sheet.class::SYSTEM_NAME, character_sheet: data }
          expect(response).to render_template(:export_failed)
        end
      end

      context 'with malicious request' do
        it 'renders malicious_request page' do
          data = Hash[params.keys.first, 'Frodo']
          post :export, params: { system: nil, character_sheet: data }
          expect(response).to render_template(:malicious_request)
        end
      end
    end
  end
end
