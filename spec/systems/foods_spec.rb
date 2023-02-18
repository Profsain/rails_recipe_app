require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  user = User.create(name: 'Hassan', email: 'hassan@gmail.com', password: '123456')

  subject do
    Food.new(name: 'Rice', measurement_unit: 'kg', price: 10, quantity: 1, user_id: user.id)
  end
  before { subject.save }

  describe 'index page' do
    it 'I can see the button.' do
      visit root_path
      page.has_button?('Add Food')
    end
    it 'I can see the food name.' do
      visit root_path
      page.has_content?('Rice')
    end
    it 'I can see the food measurement unit.' do
      visit root_path
      page.has_content?('kg')
    end
    it 'I can see the food price.' do
      visit root_path
      page.has_content?('10')
    end
    it 'I can see the food quantity.' do
      visit root_path
      page.has_content?('1')
    end
  end
end
