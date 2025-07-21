class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.integer :img_id
      t.string  :shop_name
      t.text    :caption
      t.integer :user_id
      t.timestamps
    end
  end
end
