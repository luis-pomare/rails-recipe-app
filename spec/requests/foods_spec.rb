require 'rails_helper'

RSpec.describe 'Public recipes', type: :request do
  describe 'GET /public_recipes' do
    before :each do
      get '/'
    end

    it 'should have a http status of 200(correct status)' do
      expect(response).to have_http_status(200)
    end

    it 'should render public_recipe/index view' do
      expect(response).to render_template('public_recipes/index')
    end

    it 'should include the placeholder text' do
      expect(response.body).to include('Recipes shared by the comunity')
    end
  end
end
