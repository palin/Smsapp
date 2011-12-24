class AddCallIdToSms < ActiveRecord::Migration
  def change
    add_column :sms, :call_id, :string
  end
end
