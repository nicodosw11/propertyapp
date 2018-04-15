class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birthday, :date
    add_column :users, :address, :string
    add_column :users, :zipcode, :string
    add_column :users, :town, :string
    add_column :users, :phone_number, :string
  end
end
