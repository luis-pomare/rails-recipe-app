require 'rails_helper'

RSpec.describe "foods/edit", type: :view do
  let(:food) {
    Food.create!(
      Name: "MyString",
      unit: "MyString",
      price: 1,
      quantity: 1,
      user: nil
    )
  }

  before(:each) do
    assign(:food, food)
  end

  it "renders the edit food form" do
    render

    assert_select "form[action=?][method=?]", food_path(food), "post" do

      assert_select "input[name=?]", "food[Name]"

      assert_select "input[name=?]", "food[unit]"

      assert_select "input[name=?]", "food[price]"

      assert_select "input[name=?]", "food[quantity]"

      assert_select "input[name=?]", "food[user_id]"
    end
  end
end
