class CreateProperties < ActiveRecord::Migration[8.1]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :kind, null: false, default: 0
      t.integer :deal_kind, null: false, default: 0
      t.string :state, limit: 2, null: false
      t.string :city, limit: 100, null: false
      t.string :district, limit: 100, null: false
      t.string :zip_code, limit: 10, null: false
      t.bigint :rent_value_cents, default: 0
      t.bigint :sale_value_cents, default: 0
      t.boolean :negotiable, null: false, default: false

      t.timestamps
    end

    add_index :properties, :kind
    add_index :properties, :deal_kind
    add_index :properties, :state
    add_index :properties, :city
    add_index :properties, :district
  end
end
