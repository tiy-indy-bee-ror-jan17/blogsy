class AddVotesToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :votes, :integer, default: 1
  end
end
