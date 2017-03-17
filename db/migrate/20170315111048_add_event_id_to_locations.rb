class AddEventIdToLocations < ActiveRecord::Migration
  def change
  	 add_column :locations, :event_id, :int
  end
end
