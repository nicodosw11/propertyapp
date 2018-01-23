class AddPledgeAmountToInvestments < ActiveRecord::Migration[5.0]
  def change
    add_column :investments, :pledge_amount, :integer
  end
end
