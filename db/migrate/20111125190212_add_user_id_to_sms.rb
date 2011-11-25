class AddUserIdToSms < ActiveRecord::Migration
  def change
    add_column :sms, :user_id, :integer
  end
end
