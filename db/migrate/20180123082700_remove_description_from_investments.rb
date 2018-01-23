class RemoveDescriptionFromInvestments < ActiveRecord::Migration[5.0]
  def change
    remove_column :investments, :description, :string
  end
end
