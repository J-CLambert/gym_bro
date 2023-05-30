class CreateGyms < ActiveRecord::Migration[7.0]
  def change
    create_table :gyms do |t|
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
