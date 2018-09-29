class ChangeColumnAwards < ActiveRecord::Migration
  def change
    change_column :awards, :award_name, :string
  end
end
