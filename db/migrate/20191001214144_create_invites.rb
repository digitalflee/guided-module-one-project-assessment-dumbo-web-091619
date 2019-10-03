class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.integer :guest_id
      t.integer :event_id 
    end 
  end
end
