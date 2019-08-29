class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.string :image, null: false
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
