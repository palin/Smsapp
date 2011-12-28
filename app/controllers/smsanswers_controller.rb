class SmsanswersController < ApplicationController
  def index
    @sms_answers = SmsAnswer.order(sort_column + " " + sort_direction)
  end

  private

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
