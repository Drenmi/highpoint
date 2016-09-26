class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :identification, null: false

      t.string :name
      t.text :address
      t.string :phone_number
      t.string :email_address

      t.timestamps null: false
    end
  end
end
