class AddCodeAndBodyToSmsAnswers < ActiveRecord::Migration
  def change
    add_column :sms_answers, :code, :string
    add_column :sms_answers, :body, :text
  end
end
