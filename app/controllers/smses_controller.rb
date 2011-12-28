class SmsesController < ApplicationController

  include SmsesHelper

  def new
    @sms = Sms.build_from_params(params)
    @sms.save!
    message = ""
    if check_sms(@sms)
      if not_forbidden?(@sms.content)     
        @sms.app_started = true
        @sms.save!
        
        @command = Command.find_by_command(@sms.content)
        unless @command.nil?
          @app = Application.find_by_id(@command.application_id)
          unless @app.nil?            
            @app.last_used = @sms.created_at
            @app.last_used_by = User.find_by_phone(@sms.from).id
            @app.save!
            start_application(@app.command, @sms) 
          else
            message += "application not found; "  
          end
        else
          message += "command not found; "
        end   
      else
        message += "command forbidden; "  
        send_sms(message, @sms)
      end
      @command = Command.find_by_command(@sms.content)
      @command.last_used = @sms.created_at
      @command.last_used_by = User.find_by_phone(@sms.from).id
      @command.save!
    end
    redirect_to smses_path
  end
  
end
