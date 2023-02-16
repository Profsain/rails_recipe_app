require 'rails_helper'

RSpec.describe 'Index page of Food', type: :system do
  before do
    user2 = User.create(id: 2, name: 'Test', email: 'Test@rspec.check', password: '123456')
    user2.save
    food1 = user2.foods.new(name: 'Eggs', measurement_unit: '100 grams', price: 10)
    food1.save
  end

  describe 'foods index page testing' do
    before :each do
      visit '/foods'
      fill_in 'Email', with: 'Test@rspec.check'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_link 'Foods'
    end

    it 'should display the welcome page' do
      expect(page).to have_text('Welcome to the Food Index Page')
    end

    it 'should display the food name' do
      expect(page).to have_text('Eggs')
    end

    it 'should display the measurement_unit' do
      expect(page).to have_text('100 grams')
    end

    it 'should display the price' do
      expect(page).to have_text(10)
    end

    it 'should have the text of recipe app' do
      expect(page).to have_text('Below Is a List Of Foods in our Recipe App')
    end
  end
end
