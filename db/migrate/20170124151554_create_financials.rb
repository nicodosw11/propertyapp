class CreateFinancials < ActiveRecord::Migration[5.0]
  def change
    create_table :financials do |t|
      t.float :estimated
      t.float :ppsm

      t.timestamps
    end
  end
end
