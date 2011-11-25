class Program < ActiveRecord::Base

	validates_presence_of :name, :command, :uniqueness => true
end
