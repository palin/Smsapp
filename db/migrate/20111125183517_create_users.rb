class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :name
      t.string    :surname
      t.string    :login
      t.string    :password
      t.string    :email
      t.datetime  :deleted_at
      t.integer   :deleted_by_id
      t.string    :deleted_reason
      t.datetime  :created_at
      t.datetime  :udated_at
      t.string    :phone
      t.integer   :sms_sent

      t.timestamps
    end
  end
end
