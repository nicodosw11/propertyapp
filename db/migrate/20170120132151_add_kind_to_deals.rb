class AddKindToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :kind, :string
  end
end
