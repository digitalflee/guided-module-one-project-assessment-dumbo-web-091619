class CreateHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :email 
      t.string :username
      t.string :password 
    end 
  end
end
