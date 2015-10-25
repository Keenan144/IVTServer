class AddUserNameToUnits < ActiveRecord::Migration
  def change
    add_column :units, :username, :string
  end
end
