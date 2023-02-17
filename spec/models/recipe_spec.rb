require 'rails_helper'

RSpec.describe Recipe, type: :model do
  user = User.new(name: 'user1', email: 'abc@abc.com', password: 1_234_567)
  subject do
    Recipe.new(name: 'recipe 1', description: 'testing recipe', cooking_time: 20, preparation_time: 30, public: true,
               user_id: user.id)
  end
  before { subject.save }

  it 'name should not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'description should  not be blank' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'cooking time should not be blank' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'cooking time should not be blank' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'should render private as false' do
    expect(subject.public).to eql(true)
  end

  it 'should have user_id' do
    expect(subject.user_id).to eql(user.id)
  end

  it 'should have many recipe_foods' do
    expect(subject).to respond_to(:recipe_foods)
  end
end
