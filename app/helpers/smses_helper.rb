module SmsesHelper

  require "net/http"
  require "uri"

  def check_sms(sms)   
    if api_correct?(sms.api) and from_correct?(sms.from) and to_correct?(sms.to) and content_correct?(sms)
      true
    else
      false
    end
  end

  def api_correct?(api)
    if api.include? "url" or api.include? "URL"
      true
    else
      false
    end
  end

  def from_correct?(from)
    User.all.each do |u|
      if from.include? u.phone
        return true
      else
        return false
      end
    end
  end

  def to_correct?(to)
    if to.include? "startapp"
      true
    else
      false
    end
  end

  def content_correct?(sms)
    content = sms.content
    if content.include? 'startapp '
      content = content.gsub('startapp ','')
    end
    Command.all.each do |c|      
      if content == c.command
        return true
      end  
    end  
    send_sms("Command not recognized", sms)  
    false
  end

  def not_forbidden?(content)
    @app = Application.find_by_id(Command.find_by_command(content).application_id)
    unless @app.nil?
      if @app.allowed
        true
      else
        false
      end
    end
  end

  def start_application(command, sms)
    if system(command)
      send_sms("Application started correctly!", sms)
    else
      send_sms("Application's start failed.", sms)
    end
  end

  def send_sms(text, sms)
    access_key = "ea1d41f15b2"
    address = "http://run.orangeapi.com/sms/sendSMS.xml"
    from = "447797805210"
    to = sms.from
    long_text = "true"
    max_sms = "3"
    ack = "true"
    content_encoding = "gsm7"
    content = "SMS API:"+text

    link = address+"?id="+access_key+"&from="+from+"&to="+to+"&content="+content+"&long_text="+long_text+"&max_sms="+max_sms+"&ack="+ack+"&content_encoding="+content_encoding
    link = link.gsub(' ','_')
    uri = URI.parse(link)
    
    http = Net::HTTP.new(uri.host, uri.port)  
    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    response_message = ""

    response.each_header { |h| response_message+= h.to_s + " = " + response[h] + "; "}

    @sms_answer = SmsAnswer.new
    @sms_answer.uri = uri
    @sms_answer.response = response_message
    @sms_answer.code = response.code
    @sms_answer.body = response.body
    @sms_answer.save!
  end

end
