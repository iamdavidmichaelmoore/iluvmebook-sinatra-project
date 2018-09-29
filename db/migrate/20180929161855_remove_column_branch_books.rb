class RemoveColumnBranchBooks < ActiveRecord::Migration
  def change
    remove_column :books, :branch, :string
  end
end
