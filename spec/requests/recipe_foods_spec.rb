require 'rails_helper'

RSpec.describe 'InventoryFoods', type: :request do
  describe 'GET index/new' do
    before(:each) do
      user = User.create name: 'Tom', email: 'tom@example.com', password: '123456'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      recipe = Recipe.create name: 'Recipe 1', description: 'This is recipe 1', user_id: user.id, preparation_time: 1,
                             cooking_time: 1, public: true
      get new_recipe_recipe_food_path(recipe.id)
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
