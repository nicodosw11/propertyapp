class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.text :description
      t.string :address
      t.string :image_url
      t.string :occupancy
      t.float :valuation
      t.float :funded
      t.integer :current_investors
      t.float :yield
      t.float :timeline

      t.timestamps
    end
  end
end
