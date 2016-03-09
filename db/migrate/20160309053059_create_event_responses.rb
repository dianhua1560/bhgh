class CreateEventResponses < ActiveRecord::Migration
  def change
    create_table :event_responses do |t|
    	t.string :email
    	t.string :event_id
    	t.string :response
      t.timestamps null: false
    end
  end
end
