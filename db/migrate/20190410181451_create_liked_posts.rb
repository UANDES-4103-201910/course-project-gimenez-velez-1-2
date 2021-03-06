class CreateLikedPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :liked_posts do |t|
      t.date :creation_date
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :positive
      t.timestamps
    end
  end
end
