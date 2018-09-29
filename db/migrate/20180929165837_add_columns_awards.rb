class AddColumnsAwards < ActiveRecord::Migration
  def change
    add_column :awards, :issue_date, :string
    add_column :awards, :issuing_command_unit, :string
    add_column :awards, :location, :string
    add_column :awards, :award_name, :blob
  end
end
