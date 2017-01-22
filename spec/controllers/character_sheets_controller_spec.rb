require 'rails_helper'

RSpec.describe CharacterSheetsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #fate" do
    it "returns http success" do
      get :fate
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, params: { system: CharacterSheets::FateCore::SYSTEM_NAME, character_sheet: { name: 'foobar' } }
      expect(response).to redirect_to edit_character_sheet_path(CharacterSheet.first)
    end

    it "renders new page" do
      allow_any_instance_of(CharacterSheets::FateCore).to receive(:save).and_return(false)
      post :create, params: { system: CharacterSheets::FateCore::SYSTEM_NAME, character_sheet: { name: 'bar' } }
      expect(response).to have_http_status(:success)
    end
  end
end
