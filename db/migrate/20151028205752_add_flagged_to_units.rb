class AddFlaggedToUnits < ActiveRecord::Migration
  def change
    add_column :units, :flagged, :boolean, :default => false
  end
end
