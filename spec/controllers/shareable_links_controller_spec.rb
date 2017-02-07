require 'rails_helper'

RSpec.describe ShareableLinksController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:character_sheet) { FactoryGirl.create(:fate_core_sheet, :with_shareable_link, user: user) }

  before do
    sign_in user
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, params: { character_sheet_id: character_sheet.id }, format: :js
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy, params: { character_sheet_id: character_sheet.id, token: character_sheet.shareable_link.token }, format: :js
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { token: character_sheet.shareable_link.token }
      expect(response).to render_template(:show)
    end

    it "shows not found page" do
      get :show, params: { token: 'unexisting' }
      expect(response).to render_template(:not_found)
    end

    it "shows not found page" do
      expect { get :show, params: { token: nil } }.to raise_error(ActionController::UrlGenerationError)
    end
  end
end
