require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.new(Name: 'EMre', Photo: 'https://github.com', Bio: 'a perfect person', posts_counter: 0)
    post = Post.create(Title: 'Titlee', Text: 'Text', comments_counter: 0, likes_counter: 0, author: user)
    Comment.create(Text: 'This is a comment', author: user, post: post)
    Comment.create(Text: 'No comment', author: user, post: post)
  end

  it 'should update comments counter' do
    expect(subject.update_comments_counter).to eq true
    expect(subject.post.comments_counter).to eq 3
  end
end