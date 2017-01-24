class AddDealRefToProperties < ActiveRecord::Migration[5.0]
  def change
    add_reference :properties, :deal, foreign_key: true
  end
end
