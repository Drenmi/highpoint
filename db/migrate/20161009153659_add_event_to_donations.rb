class AddEventToDonations < ActiveRecord::Migration
  def change
    add_reference :donations, :event, index: true, foreign_key: true
  end
end
