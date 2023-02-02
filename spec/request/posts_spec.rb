require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before do
      @ability = Ability.new(@first_user)
      @first_user = User.create(name: 'Tom', photo: 'https://randomuser.me/api/portraits/men/23.jpg', bio: 'Teacher from Mexico.')
      @first_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post.')
    end
    it 'is success' do
      get "/users/#{@first_user.id}/posts"
      expect(response).to have_http_status(:ok)
    end
    it 'is rendered index' do
      get "/users/#{@first_user.id}/posts"
      expect(response).to render_template('index')
    end
    it 'posts rendered' do
      get "/users/#{@first_user.id}/posts"
      expect(response.body).to include(@first_post.Text)
    end

    it 'is success' do
      get "/users/#{@first_user.id}/posts/#{@first_post.id}"
      expect(response).to have_http_status(:success)
    end
    it 'show template rendered' do
      get "/users/#{@first_user.id}/posts/#{@first_post.id}"
      expect(response).to render_template('show')
    end
    it 'renders a users specific post' do
      get "/users/#{@first_user.id}/posts/#{@first_post.id}"
      expect(response.body).to include(@first_post.Title)
    end
  end
end
