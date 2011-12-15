class AddFromToSms < ActiveRecord::Migration
  def change
    add_column :sms, :from, :string
  end
end
