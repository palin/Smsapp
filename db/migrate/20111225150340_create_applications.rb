class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :command
      t.boolean :allowed
      t.datetime :last_used
      t.datetime :created_at

      t.timestamps
    end
  end
end
