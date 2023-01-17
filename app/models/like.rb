class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  after_save :update_likes_counter
  
  validates :LikesCounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def update_likes_counter
    post.update(LikesCounter: post.LikesCounter + 1)
  end
end
