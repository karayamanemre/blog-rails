class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :comments
  has_many :likes

  def update_posts_counter
    author.update(posts_counter: author.posts_counter + 1)
  end

  def recent_5_comments
    comments.order(created_at: :desc).limit(5)
  end
end
