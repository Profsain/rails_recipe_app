require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'user1', email: 'abc@abc.com', password: 1_234_567) }
  before { subject.save }

  it 'name should not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email should not be blank' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'should have many recipes' do
    expect(subject).to respond_to(:recipes)
  end

  it 'should have many foods' do
    expect(subject).to respond_to(:foods)
  end

  it 'should have many inventories' do
    expect(subject).to respond_to(:inventories)
  end
end
