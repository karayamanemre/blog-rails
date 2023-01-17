class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  after_save :update_posts_counter

  validates :Title, presence: true, length: { maximum: 250 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def update_posts_counter
    author.update(posts_counter: author.posts_counter + 1)
  end

  def recent_5_comments
    comments.order(created_at: :desc).limit(5)
  end
end