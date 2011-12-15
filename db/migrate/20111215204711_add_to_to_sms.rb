class AddToToSms < ActiveRecord::Migration
  def change
    add_column :sms, :to, :string
  end
end
