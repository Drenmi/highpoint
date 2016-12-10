class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :identification, null: false

      t.string :title
      t.string :name
      t.text :address
      t.string :postal_code
      t.string :phone_number
      t.string :email_address
      t.text :comments

      t.timestamps null: false
    end

    add_index :donors, :identification, unique: true
    add_index :donors, :name
  end
end
