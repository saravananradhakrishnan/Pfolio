class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.datetime :published_at
      t.boolean :is_published

      t.timestamps
    end
  end
end
