class ChangeColumnNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :LikesCounter, :likes_counter
    rename_column :posts, :CommentsCounter, :comments_counter
    rename_column :users, :PostsCounter, :posts_counter
  end
end
