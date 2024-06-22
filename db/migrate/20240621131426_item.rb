class Item < ActiveRecord::Migration[7.0]
  def change
    drop_table :items do |t|
      t.string :item_name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :area_id, null: false
      t.integer :delivery_date_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

