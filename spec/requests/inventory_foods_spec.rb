require 'rails_helper'

RSpec.describe 'InventoryFoods', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/inventory_foods/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/inventory_foods/create'
      expect(response).to have_http_status(:success)
    end
  end
end
