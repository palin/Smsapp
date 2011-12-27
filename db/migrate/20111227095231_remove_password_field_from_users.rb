class RemovePasswordFieldFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :password_field
  end

  def down
    add_column :users, :password_field, :string
  end
end
