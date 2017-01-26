require 'rails_helper'

RSpec.describe GeneralController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET unexisting resource' do
    it 'falls back to 404 page' do
      get :not_found, params: { path: 'foobar' }
      expect(response).to have_http_status(:success)
    end
  end

end
