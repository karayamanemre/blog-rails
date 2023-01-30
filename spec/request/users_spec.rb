require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'is success' do
      get('/')
      expect(response).to have_http_status(:ok)
    end
    it 'is rendered index' do
      get ('/')
      expect(response).to render_template('index')
    end
  end

  describe 'GET /users/:id' do
    before do
      @first_user  = User.create(Name: "Tom", Photo: "https://randomuser.me/api/portraits/men/23.jpg", Bio: "Teacher from Mexico.")
      @first_post = Post.create(author: @first_user, Title: "Hello", Text: "This is my first post.")
    end
    it 'is success' do
      get "/users/#{@first_user.id}"
      expect(response).to have_http_status(:success)
    end
    it 'show template rendered' do
      get "/users/#{@first_user.id}"
      expect(response).to render_template('show')
    end
    it 'renders user profile' do
      get "/users/#{@first_user.id}"
      expect(response.body).to include(@first_post.Text)
    end
  end
end
