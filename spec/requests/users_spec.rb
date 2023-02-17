require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before(:each) do
      @user = User.create!(name: 'abc', email: 'abc@abc.com', password: '123456')
      get new_user_session_path
    end

    it 'should sign in user' do
      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      expect(response).to redirect_to(root_path)
    end
  end
end
