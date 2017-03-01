class AddDefaultsToCounterCaches < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :posts_count, 0
    change_column_default :posts, :comments_count, 0
  end
end
