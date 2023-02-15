require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET index' do
    before(:each) do
      user = User.create name: 'Tom', email: 'tom@example.com', password: '123456'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get root_path
    end

    it 'should return http request' do
      expect(response.status).to eq(302) # redirected
    end

    it 'should render correct path' do
      path = 'http://www.example.com/users/sign_in'
      expect(response).to redirect_to(path)
    end

    it "should render page contenting 'redirected'" do
      expect(response.body).to include('redirected')
    end
  end
end
