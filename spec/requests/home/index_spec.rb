require 'rails_helper'

RSpec.describe 'Home index page', type: :request do
  describe 'GET /' do
    it 'returns the home page' do
      get root_path

      expect(response).to have_http_status(:success)
      expect(response.body).to include('Welcome to the Home Page')
    end
  end
end
