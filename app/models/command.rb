class Command < ActiveRecord::Base
  validates_presence_of :command, :application_id, :added_by, :on => :create
end
