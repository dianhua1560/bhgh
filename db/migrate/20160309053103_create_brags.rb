class CreateBrags < ActiveRecord::Migration
  def change
    create_table :brags do |t|
    	t.string :author
    	t.string :title
    	t.text :body
    	t.string :subject
      t.timestamps null: false
    end
  end
end
