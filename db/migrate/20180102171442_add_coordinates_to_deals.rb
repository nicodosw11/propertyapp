class AddCoordinatesToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :latitude, :float
    add_column :deals, :longitude, :float
  end
end
