class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.string :url
    	t.integer :object_id
    	t.string :object_type
      t.timestamps null: false
    end
  end
end
