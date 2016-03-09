class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :position
      t.string :phone
      t.timestamps null: false
    end
  end
end
