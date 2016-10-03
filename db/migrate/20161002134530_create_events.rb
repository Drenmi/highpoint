class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.date :start_on, null: false
      t.date :end_on, null: false

      t.timestamps null: false
    end
  end
end
