class AddStatusToInvestments < ActiveRecord::Migration[5.0]
  def change
    add_column :investments, :status, :string
  end
end
