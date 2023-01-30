require 'rails_helper'

RSpec.describe 'visit the user home page', type: :system do
  before do
    @user1 = User.create(id: 1, Name: 'Tom', Photo: 'https://randomuser.me/api/portraits/men/13.jpg', Bio: 'Teacher.', posts_counter: 0)
    @user2 = User.create(id: 2, Name: 'Lilly', Photo: 'https://randomuser.me/api/portraits/women/21.jpg', Bio: 'Barista.', posts_counter: 0)
    @post1 = Post.create(author: @user1, Title: 'My first post.', Text: 'My post description.', comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(author: @user2, Title: 'My second post.', Text: 'My post description.', comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(author: @user1, Title: 'My third post.', Text: 'My post description.', comments_counter: 0, likes_counter: 0)
    Comment.create(post: @post1, author: @user2, Text: 'Good boy!')
    Comment.create(post: @post2, author: @user1, Text: 'Good girl!')
  end

  describe 'index page' do
    it 'shows the username of all other users' do
      visit '/'
      expect(page).to have_content(@user1.Name)
    end

    it 'show the profile picture for each user' do
      visit '/'
      expect(page).to have_selector("img[src*='#{@user1.Photo}']")
    end

    it 'shows number of posts each user has written' do
      visit '/'
      expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
    end

    it 'directs to the users profile page' do
      visit '/'
      click_on @user2.Name
      expect(page).to have_current_path("/users/#{@user2.id}/")
    end
  end
end
