class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :text, null: false
      t.string :image
      t.references :user, foreign_key: true
      t.references :post_category, foreign_key: true
      t.timestamps
    end
  end
end
