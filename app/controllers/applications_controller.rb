class ApplicationsController < ApplicationController

  before_filter :require_user, :only => :index
  
  def index
    @applications = Application.order(sort_column + " " + sort_direction)
  end

  private

    def sort_column
      Application.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
