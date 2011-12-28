class AddAppStartedToSmses < ActiveRecord::Migration
  def change
    add_column :sms, :app_started, :boolean
  end
end
