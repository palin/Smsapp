class AddCryptedPasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :crypted_password, :varchar
  end
end
