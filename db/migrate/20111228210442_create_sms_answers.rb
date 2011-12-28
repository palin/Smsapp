class CreateSmsAnswers < ActiveRecord::Migration
  def change
    create_table :sms_answers do |t|
      t.string :uri
      t.string :response

      t.timestamps
    end
  end
end
