class CommandsController < ApplicationController
  def index
    @commands = Command.order(sort_column + " " + sort_direction)
  end

  private

    def sort_column
      Command.column_names.include?(params[:sort]) ? params[:sort] : "command"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
