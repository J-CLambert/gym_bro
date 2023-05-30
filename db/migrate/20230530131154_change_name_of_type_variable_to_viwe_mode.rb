class ChangeNameOfTypeVariableToViweMode < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :type, :owner 
  end
end
