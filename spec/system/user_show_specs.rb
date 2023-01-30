require 'rails_helper'

RSpec.describe 'user profile page', type: :system do
  before do
    @user1 = User.create(id: 1, Name: 'Tom', Photo: 'https://randomuser.me/api/portraits/men/19.jpg', Bio: 'Teacher.', posts_counter: 0)
    @user2 = User.create(id: 2, Name: 'Lilly', Photo: 'https://randomuser.me/api/portraits/women/29.jpg', Bio: 'Barista.',posts_counter: 0)
    @post1 = Post.create(author: @user1, Title: 'My first post.', Text: 'Pharetra pharetra massa massa ultricies mi quis hendrerit dolor magna eget est lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus', comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(author: @user2, Title: 'My second post.', Text: 'Congue eu consequat ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus', comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(author: @user1, Title: 'My third post.', Text: 'metus vulputate eu scelerisque felis imperdiet proinr libero', comments_counter: 0, likes_counter: 0)
    Comment.create(post: @post1, author: @user2, Text: 'Good boy!')
    Comment.create(post: @post2, author: @user1, Text: 'Good girl!')
  end

  it "display the user's profile image" do
    visit "/users/#{@user1.id}"
    expect(page).to have_selector("img[src*='#{@user1.Photo}']")
  end

  it "display the user's name" do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@user1.Name)
  end

  it 'displays number of posts from the user' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
  end

  it 'displays theuser\'s bio ' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@user1.Bio)
  end

  it 'displays 2 recent posts' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@post1.Text)
    expect(page).to have_content(@post3.Text)
  end

  it 'should redirect to the users profile page' do
    visit "/users/#{@user1.id}"
    click_button("See all posts")
    expect(page).to have_current_path("/users/#{@user1.id}/posts")
  end
end