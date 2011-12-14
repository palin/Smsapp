class AddPersistenceTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :persistence_token, :varchar
  end
end
