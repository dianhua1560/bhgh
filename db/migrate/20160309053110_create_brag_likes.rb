class CreateBragLikes < ActiveRecord::Migration
  def change
    create_table :brag_likes do |t|
    	t.string :email
    	t.integer :brag_id
      t.timestamps null: false
    end
  end
end
