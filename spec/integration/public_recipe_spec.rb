require 'rails_helper'
RSpec.describe 'User', type: :system do
  describe 'Users' do
    let(:recipe) do
      Recipe.create(name: 'cake', preparation_time: 20, cooking_time: 10, description: 'Cake recipe', public: true,
                    user_id: 1, id: 1)
    end

    describe 'testing page rendering' do
      it 'should render the public recipe path' do
        visit '/'
        expect(page).to have_current_path('/')
      end
    end

    describe 'testing page content' do
      it 'should render the public recipe path' do
        visit '/'
        expect(page).to have_content('by the comunity')
      end
    end
  end
end
