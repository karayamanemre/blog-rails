require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    first_user = User.new(Name: 'EMre', Photo: 'https://github.com', Bio: 'a perfect person', posts_counter: 0)
    first_post = Post.create(Title: 'Titlee', Text: 'Text', comments_counter: 0, likes_counter: 0, author: first_user)
    Comment.create(Text: 'This is a comment', author: first_user, post: first_post)
    Comment.create(Text: 'No comment', author: first_user, post: first_post)
  end

  it 'should update comments counter' do
    expect(subject.update_comments_counter).to eq true
    expect(subject.post.comments_counter).to eq 2
  end
end
