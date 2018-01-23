class RemovePriceFromInvestments < ActiveRecord::Migration[5.0]
  def change
    remove_column :investments, :price, :float
  end
end
