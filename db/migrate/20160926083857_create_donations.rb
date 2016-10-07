class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :donor, index: true, foreign_key: true
      t.references :cause, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.decimal :amount, null: false

      t.timestamps null: false
    end
  end
end
