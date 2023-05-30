class RenameLocationInGyms < ActiveRecord::Migration[7.0]
  def change
    rename_column :gyms, :location, :address
  end
end
