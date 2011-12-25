class HomeController < ApplicationController

  before_filter :require_user, :only => :index

	def index
	end

  private

    def sort_column
      params[:sort] || "name"
    end

    def sort_direction
      params[:direction] || "asc"
    end
    
end
