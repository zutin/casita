class CreatePropertyRooms < ActiveRecord::Migration[8.1]
  def change
    create_table :property_rooms do |t|
      t.references :property, null: false, foreign_key: true
      t.integer :kind, null: false, default: 0

      t.timestamps
    end
  end
end
