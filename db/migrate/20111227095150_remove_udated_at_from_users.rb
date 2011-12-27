class RemoveUdatedAtFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :udated_at
  end

  def down
    add_column :users, :udated_at, :datetime
  end
end
