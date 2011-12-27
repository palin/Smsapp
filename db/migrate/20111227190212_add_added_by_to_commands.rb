class AddAddedByToCommands < ActiveRecord::Migration
  def change
    add_column :commands, :added_by, :integer
  end
end
