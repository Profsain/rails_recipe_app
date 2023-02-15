require 'rails_helper'

RSpec.describe 'Inventories', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/inventories/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/inventories/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/inventories/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/inventories/show'
      expect(response).to have_http_status(:success)
    end
  end
end
