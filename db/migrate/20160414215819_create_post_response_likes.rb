class CreatePostResponseLikes < ActiveRecord::Migration
  def change
    create_table :post_response_likes do |t|
      t.integer :post_response_id
      t.string :email

      t.timestamps null: false
    end
  end
end
