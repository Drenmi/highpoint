class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :shortcode, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
