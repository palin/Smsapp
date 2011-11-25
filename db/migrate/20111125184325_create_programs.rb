class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.string :command
      t.datetime :last_used
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
