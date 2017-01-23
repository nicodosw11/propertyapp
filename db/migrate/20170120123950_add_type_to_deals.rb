class AddTypeToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :type, :string
  end
end
