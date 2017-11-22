class CreateTenants < ActiveRecord::Migration[5.0]
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :age
      t.references :deal, foreign_key: true

      t.timestamps
    end
  end
end
