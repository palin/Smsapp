class SmsesController < ApplicationController
	
	#before_filter :require_user, :only => :index
	
	def index
    @smses = Sms.order(sort_column + " " + sort_direction)
  end  

	def new
		@sms = Sms.build_from_params(params)
		#params: api [api method used: URL], call_id [sms identifier], dateCreated [date and time of reception]
		#from [sender's mobile], to [api reception's shortcode], content [content of the sms]		#from [sender's mobile], to [api reception's shortcode], content [content of the sms]
		@sms.save!
		#system(@sms.content)
		redirect_to smses_path
	end

	private

    def sort_column
      Sms.column_names.include?(params[:sort]) ? params[:sort] : "received_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
