class RemoveTypeFromDeals < ActiveRecord::Migration[5.0]
  def change
    remove_column :deals, :type, :string
  end
end
