class AddContentToSms < ActiveRecord::Migration
  def change
    add_column :sms, :content, :text
  end
end
