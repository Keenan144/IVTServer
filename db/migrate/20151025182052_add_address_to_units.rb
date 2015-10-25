class AddAddressToUnits < ActiveRecord::Migration
  def change
    add_column :units, :address, :text
  end
end
