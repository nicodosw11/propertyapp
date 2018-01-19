class AddInputsToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :current_funding, :integer, default: 0
    add_column :deals, :duration, :integer
    add_column :deals, :property_value, :integer
    add_column :deals, :interest_rate, :decimal, precision: 5, scale: 2, default: 1.5
  end
end
