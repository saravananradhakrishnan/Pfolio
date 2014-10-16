class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id
      t.string :site_name
      t.integer :site_id
      t.string :image_name
      t.string :image_url

      t.timestamps
    end
  end
end
