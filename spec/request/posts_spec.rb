require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'is success' do
      get('/users/1/posts')
      expect(response).to have_http_status(:ok)
    end
    it "is rendered index" do
      get '/users/1/posts'
      expect(response).to render_template('index')
    end
    it 'posts rendered' do
      get '/users/1/posts'
      expect(response.body).to include('All posts from a specific user')
    end
  end

  describe 'GET /users/:id/posts/:id' do
    it 'is a HTTP success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
    end
    it 'show template rendered' do
      get '/users/1/posts/1'
      expect(response).to render_template('show')
    end
    it 'renders a users specific post' do
      get '/users/1/posts/1'
      expect(response.body).to include('A post from a specific user')
    end
  end
end
