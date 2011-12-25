class SmsesController < ApplicationController

  def new
    @sms = Sms.build_from_params(params)
    #params: api [api method used: URL], call_id [sms identifier], dateCreated [date and time of reception]
    #from [sender's mobile], to [api reception's shortcode], content [content of the sms]   #from [sender's mobile], to [api reception's shortcode], content [content of the sms]
    @sms.save!
    #system(@sms.content)
    redirect_to smses_path
  end
  
end
