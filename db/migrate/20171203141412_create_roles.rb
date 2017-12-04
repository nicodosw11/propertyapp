class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :role
      t.references :deal, index: true, foreign_key: true

      t.timestamps
    end
  end
end
