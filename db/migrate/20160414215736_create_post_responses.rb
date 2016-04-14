class CreatePostResponses < ActiveRecord::Migration
  def change
    create_table :post_responses do |t|
      t.string :author
      t.integer :post_id
      t.text :body
      t.string :response_type

      t.timestamps null: false
    end
  end
end
