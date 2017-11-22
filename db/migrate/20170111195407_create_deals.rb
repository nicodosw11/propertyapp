class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.string :street
      t.string :city
      t.string :district
      t.string :postcode
      t.string :property_type
      t.string :occupancy
      t.text :amenities_description
      t.text :location_transport_description
      t.integer :surface
      t.integer :nb_rooms
      t.integer :nb_bedrooms
      t.integer :nb_bathrooms
      t.boolean :active
      t.integer :funding_goal
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end

#=> below attributes go to properties table only later on
# @city => "Chatou"
# @district => "Yvelines"
# @postcode => "78400"
# @property_type => "Appartement"
# @occupancy => "Viager occupé"
# @surface => 105m²
# @nb_bedrooms => 2
# @nb_bathrooms => 1
# @amenities_description => text
# @location_transport_description => text
