require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe 'GET unexisting resource' do
    it 'falls back to 404 page' do
      get :not_found, params: { path: 'foobar' }
      expect(response).to have_http_status(:success)
    end
  end
end
