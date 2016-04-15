class AddAvatarToBrags < ActiveRecord::Migration
  def self.up 
    add_attachment :brags, :avatar
  end
  def self.down
    remove_attachment :brags, :avatar
  end
end
