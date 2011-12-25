class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :command
      t.integer :application_id
      t.datetime :created_at
      t.datetime :last_used
      t.integer :last_used_by

      t.timestamps
    end
  end
end
