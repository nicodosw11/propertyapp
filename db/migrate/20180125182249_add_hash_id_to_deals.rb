class AddHashIdToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :hash_id, :string, null: false
    add_index :deals, :hash_id, unique: true
  end
end
