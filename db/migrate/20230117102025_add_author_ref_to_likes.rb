# frozen_string_literal: true

class AddAuthorRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, foreign_key: { to_table: :users }
  end
end
