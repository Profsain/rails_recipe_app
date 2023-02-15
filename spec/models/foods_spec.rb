require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    @user = User.create(name: 'Hassan', email: 'hassan@mail.com', password: 'password')
    Food.create(name: 'Rice', measurement_unit: 'kg', price: 2, user: @user)
  end

  before(:each) { subject.save }

  it 'should have name Rice' do
    expect(subject.name).to eql('Rice')
  end

  it 'should have Measurement unit kg' do
    expect(subject.measurement_unit).to eql('kg')
  end

  it 'Should always have Measurement unit present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'should have price of 2' do
    expect(subject.price).to eql(2)
  end

  it 'Should always have Price present' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'Price should be greater than or equal to 0' do
    subject.price = -1
    expect(subject).to_not be_valid
  end

  it 'Price should be an integer' do
    subject.price = 'string'
    expect(subject).to_not be_valid
  end
end
