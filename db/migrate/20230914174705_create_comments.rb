class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
