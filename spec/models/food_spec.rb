require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      food = Food.reflect_on_association(:user)
      expect(food.macro).to eq(:belongs_to)
    end

    it 'has many recipe_foods' do
      food = Food.reflect_on_association(:recipe_foods)
      expect(food.macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    it 'validates presence of name' do
      food = Food.new(name: nil)
      expect(food).not_to be_valid
      expect(food.errors[:name]).to include("can't be blank")
    end

    # Add more validation test cases as needed
  end
end
