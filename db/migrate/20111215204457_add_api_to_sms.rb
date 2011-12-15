class AddApiToSms < ActiveRecord::Migration
  def change
    add_column :sms, :api, :string
  end
end
