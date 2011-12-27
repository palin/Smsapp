class Application < ActiveRecord::Base
  validates_presence_of :name, :command, :on => :create
end
