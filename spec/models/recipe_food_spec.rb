require 'rails_helper'

RSpec.describe Recipe, type: :model do
  user = User.new(name: 'user1', email: 'testing@gmail.com', password: 1_234_567)
  recipe = Recipe.new(name: 'recipe1', preparation_time: '1hour', cooking_time: '30min', description: 'description',
                      user_id: user.id, public: true)
  food = Food.new(name: 'food1', measurement_unit: 'kg', price: 2, user_id: user.id)
  subject { RecipeFood.new(quantity: 10, food_id: food.id, recipe_id: recipe.id) }
  before { subject.save }

  it 'should have quantity 10' do
    expect(subject.quantity).to eql(10)
  end

  it 'should have recipe_id' do
    expect(subject.recipe_id).to eql(recipe.id)
  end

  it 'should have food_id' do
    expect(subject.food_id).to eql(food.id)
  end

  it 'should have quantity greater than 0' do
    subject.quantity = 0
    expect(subject).to_not be_valid
  end

  it 'should have quantity present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'should have quantity an integer' do
    subject.quantity = 'string'
    expect(subject).to_not be_valid
  end
end
