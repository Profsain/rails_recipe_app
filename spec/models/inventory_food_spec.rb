require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  user = User.new(name: 'user1', email: 'abc@abc.com', password: 1_234_567)
  food = Food.new(name: 'food1', measurement_unit: 'kg', price: 2, user_id: user.id)
  inventory = Inventory.new(name: 'inventory1', user_id: user.id)
  subject { InventoryFood.new(quantity: 10, food_id: food.id, inventory_id: inventory.id) }

  before { subject.save }

  it 'should have quantity 10' do
    expect(subject.quantity).to eql(10)
  end

  it 'should have inventory_id' do
    expect(subject.inventory_id).to eql(inventory.id)
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
