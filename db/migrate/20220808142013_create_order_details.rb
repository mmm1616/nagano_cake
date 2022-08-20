class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :amount, null: false
      t.integer :price, null: false
      t.integer :making_status, null: false, default: 0
      t.timestamps
    end
      add_foreign_key :order_details, :Orders, column: :order_id
      add_foreign_key :order_details, :Items, column: :item_id
  end
end
