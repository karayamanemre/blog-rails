require 'rails_helper'

RSpec.describe 'Render post index page', type: :feature do
  before :each do
    @user = User.create(Name: "Tom", Photo: "https://randomuser.me/api/portraits/men/23.jpg", Bio: "Teacher from Mexico.", posts_counter: 0)
    @first_post = Post.create(author: @user, Title: "Hello", Text: "This is my first post.", likes_counter: 0, comments_counter: 0)
    @second_post = Post.create(author: @user, Title: "Hello", Text: "This is my second post.", likes_counter: 0, comments_counter: 0)
    3.times do |_i|
      Comment.create(Text: 'Good boy!', author_id: @user.id, post_id: @first_post.id)
    end
    visit "/users/#{@user.id}/posts"
  end

  scenario 'displays post text' do
    expect(page).to have_content('This is my first post.')
  end

  scenario 'display the post title' do
    expect(page).to have_content(@first_post.Title)
  end

  scenario 'display the post body' do
    expect(page).to have_content(@first_post.Text)
  end

  scenario 'display the first comment on a post' do
    expect(page).to have_content('Good boy!')
  end

  scenario 'display the how many comments' do
    expect(page).to have_content('Comments: 3')
  end

  scenario 'display the how many Likes' do
    expect(page).to have_content('Likes: 0')
  end

end