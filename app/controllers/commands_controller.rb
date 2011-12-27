class CommandsController < ApplicationController
  
  before_filter :require_user, :only => :index
  
  def index
    @commands = Command.order(sort_column + " " + sort_direction)

    if params[:url].present? 
      @new_command = Command.find(params[:url]) 
    else 
      @new_command = Command.new
    end
  end

  def new
    @new_command = Command.new
  end

  def create   
    @new_command = Command.new

    @new_command.command = params[:command][:command]
    @new_command.application_id = params[:command][:application_id]
    @new_command.added_by = current_user.id

    @new_command.save!
    redirect_to commands_path
    flash[:notice] = "Command added"
  end

  def edit
  end

  def update
    @command = Command.find(params[:id])

    @command.command = params[:command][:command]
    @command.application_id = params[:command][:application_id]

    @command.save!
    redirect_to commands_path
    flash[:notice] = "Command updated"
  end

  def destroy
    command = Command.find(params[:id])
    @command.destroy

    redirect_to commands_path
    flash[:notice] = "Command deleted"
  end

  private

    def sort_column
      Command.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
