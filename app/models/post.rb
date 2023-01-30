class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, allow_blank: true }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, allow_blank: true }

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_5_comments
    comments.order(created_at: :desc).limit(5)
  end
end
