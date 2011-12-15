class AddEncryptPasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :encrypt_password, :string
  end
end
