class RemoveLikesFromBlogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :likes, :integer
  end
end
