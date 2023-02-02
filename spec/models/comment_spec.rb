require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    first_user = User.new(name: 'Emre', photo: 'https://randomuser.me/api/portraits/men/23.jpg', bio: 'a perfect person', posts_counter: 0)
    first_post = Post.create(title: 'Titlee', text: 'Text', comments_counter: 0, likes_counter: 0, author: first_user)
    Comment.create(text: 'This is a comment', author: first_user, post: first_post)
    Comment.create(text: 'No comment', author: first_user, post: first_post)
  end

  it 'should update comments counter' do
    expect(subject.update_comments_counter).to eq true
    expect(subject.post.comments_counter).to eq 2
  end
end
