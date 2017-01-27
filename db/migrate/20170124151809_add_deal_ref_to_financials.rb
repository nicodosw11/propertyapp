class AddDealRefToFinancials < ActiveRecord::Migration[5.0]
  def change
    add_reference :financials, :deal, foreign_key: true
  end
end
