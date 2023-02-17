require 'rails_helper'

RSpec.describe Inventory, type: :model do
  user = User.new(name: 'user1', email: 'abc@abc.com', password: 1_234_567)
  subject { Inventory.new(name: 'inventory1', user_id: user.id) }
  before { subject.save }

  it 'name should not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have user_id' do
    expect(subject.user_id).to eql(user.id)
  end

  it 'should have many foods' do
    expect(subject).to respond_to(:foods)
  end

  it 'should have many inventory_foods' do
    expect(subject).to respond_to(:inventory_foods)
  end

  it 'should have many foods through inventory_foods' do
    expect(subject).to respond_to(:foods)
  end
end
