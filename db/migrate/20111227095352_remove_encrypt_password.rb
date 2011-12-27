class RemoveEncryptPassword < ActiveRecord::Migration
  def up
    remove_column :users, :encrypt_password
  end

  def down
    add_column :users, :encrypt_password, :string
  end
end
