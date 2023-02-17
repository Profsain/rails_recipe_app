require 'rails_helper'

RSpec.describe 'Inventories', type: :request do
  describe 'GET index' do
    before(:each) do
      user = User.create name: 'Tom', email: 'tom@example.com', password: '123456'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get inventories_path
    end

    it 'should return http request' do
      expect(response.status).to eq(200) # redirected
    end

    it 'should render correct path' do
      expect(response.status).to eq(200)
    end

    it "should not render page contenting 'redirected'" do
      expect(response.body).not_to include('redirected')
    end
  end
end
