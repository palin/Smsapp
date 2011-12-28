class Sms < ActiveRecord::Base
	
	DATA_ATTRS = [:api, :call_id, :dateCreated, :from, :to, :content, :app_started]

	def self.build_from_params(params)
		if params[:to].present? and params[:from].present?			
			data = {}
			item = {}
			
			DATA_ATTRS.each do |attr|				
				data[attr] = params[attr]				
			end			
			data[:dateCreated] = DateTime.parse(data[:dateCreated])
			data[:app_started] = false
			Sms.new(data)
		end
	end
end
