class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.datetime :received_at
      t.string :command

      t.timestamps
    end
  end
end
