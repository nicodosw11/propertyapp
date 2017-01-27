class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.references :deal, foreign_key: true
      t.string :genre
      t.integer :surface
      t.integer :nb_rooms
      t.integer :nb_bedrooms
      t.string :city
      t.string :district
      t.string :full_address
      t.timestamps
    end
  end
end


