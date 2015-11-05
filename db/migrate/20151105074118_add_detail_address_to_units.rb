class AddDetailAddressToUnits < ActiveRecord::Migration
  def change
    add_column :units, :countryCode, :string
    add_column :units, :zip, :string
    add_column :units, :street, :string
    add_column :units, :state, :string
    add_column :units, :city, :string
  end
end
