require 'rails_helper'

RSpec.describe "Groups", type: :request do
  describe 'GET /index' do
    before(:example) { get '/groups' }

    it 'returns correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns correct response body' do
      expect(response.body).to include('Add Group')
    end
  end
end
