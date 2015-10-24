class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string   :longitude
      t.string   :latitude

      t.string   :unit_number
      t.string   :company_id

      t.timestamps null: false
    end
  end
end
