class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :remember_digest
      t.datetime :last_login
      t.integer :login_count, :default => 0

      t.integer :company_id

      t.timestamps null: false
    end
  end
end
