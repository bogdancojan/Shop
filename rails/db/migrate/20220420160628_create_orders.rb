class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.text :products
      t.float :total_price
      t.integer :discount
      t.float :final_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
