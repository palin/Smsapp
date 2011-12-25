class HomeController < ApplicationController

	def index
		@users = User.all
		@smses = Sms.all
	end

  private

    def sort_column
      params[:sort] || "name"
    end

    def sort_direction
      params[:direction] || "asc"
    end
    
end
