class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :photo, :photo_url
  end
end
