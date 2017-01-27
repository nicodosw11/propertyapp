class CreateInvestments < ActiveRecord::Migration[5.0]
  def change
    create_table :investments do |t|
      t.string :description
      t.float :amount
      t.references :deal, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
