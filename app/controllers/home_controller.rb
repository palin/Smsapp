class HomeController < ApplicationController

	def index
		@users = User.all
		@programs = Program.all
		@smses = Sms.all
	end
end
