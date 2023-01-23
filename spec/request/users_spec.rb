require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'is success' do
      get('/')
      expect(response).to have_http_status(:ok)
    end
    it "is rendered index" do
      get '/'
      expect(response).to render_template('index')
    end
    it 'users list rendered' do
      get '/'
      expect(response.body).to include('All users list and the homepage')
    end
  end

  describe 'GET /users/:id' do
    it 'is success' do
      get '/users/1'
      expect(response).to have_http_status(:success)
    end
    it 'show template rendered' do
      get '/users/1'
      expect(response).to render_template('show')
    end
    it 'renders user profile' do
      get '/users/1'
      expect(response.body).to include('A user profile')
    end
  end
end
