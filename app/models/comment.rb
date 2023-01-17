class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  after_save :update_comments_counter

  validates :CommentsCounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def update_comments_counter
    post.update(CommentsCounter: post.CommentsCounter + 1)
  end
end
