class AddGuidToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :guid, :string
  end
end
