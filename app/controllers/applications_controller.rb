class ApplicationsController < ApplicationController

  before_filter :require_user, :only => :index
  
  def index
    @applications = Application.order(sort_column + " " + sort_direction)
    
    if params[:url].present? 
      @new_app = Application.find(params[:url]) 
    else 
      @new_app = Application.new
    end
  end

  def new
    @new_app = Application.new
  end

  def create   
    @new_app = Application.new

    @new_app.name = params[:application][:name]
    @new_app.command = params[:application][:command]
    @new_app.allowed = params[:application][:allowed]

    @new_app.save!
    redirect_to applications_path
    flash[:notice] = "Application added"
  end

  def edit
  end

  def update
    @app = Application.find(params[:id])

    @app.name = params[:application][:name]
    @app.command = params[:application][:command]
    @app.allowed = params[:application][:allowed]

    @app.save!
    redirect_to applications_path
    flash[:notice] = "Application updated"
  end

  def destroy
    @app = Application.find(params[:id])
    @app.destroy

    redirect_to applications_path
    flash[:notice] = "Application deleted"
  end

  private

    def sort_column
      Application.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
