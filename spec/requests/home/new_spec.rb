require 'rails_helper'

RSpec.describe 'Home new page', type: :request do
  describe 'GET /home/new' do
    it 'redirects to login page if not authenticated' do
      get new_home_path

      expect(response).to redirect_to(new_user_session_path)
    end

    it 'returns the new home page if authenticated' do
      user = User.create!(email: 'user@example.com', password: 'password')
      sign_in user

      get new_home_path

      expect(response).to have_http_status(:success)
      expect(response.body).to include('New Home Page')
    end
  end
end
