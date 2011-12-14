class AddPasswordFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :password_field, :varchar
  end
end
