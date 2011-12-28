class AddLastUsedByToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :last_used_by, :integer
  end
end
