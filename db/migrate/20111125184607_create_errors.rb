class CreateErrors < ActiveRecord::Migration
  def change
    create_table :errors do |t|
      t.string :description

      t.timestamps
    end
  end
end
