class AddColumnToGyms < ActiveRecord::Migration[7.0]
  def change
    add_column :gyms, :priceph, :decimal, precision: 5, scale: 2
  end
end
