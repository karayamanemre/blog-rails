class ChangeColumnInTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :user_id, :post_id
  end
end
