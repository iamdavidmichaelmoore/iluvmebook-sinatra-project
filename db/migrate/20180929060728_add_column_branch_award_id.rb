class AddColumnBranchAwardId < ActiveRecord::Migration
  def change
    add_column :books, :branch_id, :integer
    add_column :books, :award_id, :integer
  end
end
