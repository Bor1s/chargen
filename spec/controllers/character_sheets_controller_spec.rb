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

  it_behaves_like 'controller_managable', :fate, :fate_core_sheet, { name: 'foo' }
  it_behaves_like 'controller_managable', :hero_quest, :hero_quest_sheet, { character_name: 'foo' }
end
