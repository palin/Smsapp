class ApplicationsController < ApplicationController
  def index
    @applications = Application.order(sort_column + " " + sort_direction)
  end

  private

    def sort_column
      Application.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
