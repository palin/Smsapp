class HistoryController < ApplicationController
    
  before_filter :require_user, :only => :index
  
  def index
    @smses = Sms.order(sort_column + " " + sort_direction)
  end    

  private

    def sort_column
      Sms.column_names.include?(params[:sort]) ? params[:sort] : "received_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
