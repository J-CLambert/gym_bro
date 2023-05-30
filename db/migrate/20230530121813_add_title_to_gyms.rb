class AddTitleToGyms < ActiveRecord::Migration[7.0]
  def change
    add_column :gyms, :title, :string
  end
end
