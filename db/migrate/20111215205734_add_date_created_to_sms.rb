class AddDateCreatedToSms < ActiveRecord::Migration
  def change
    add_column :sms, :dateCreated, :datetime
  end
end
