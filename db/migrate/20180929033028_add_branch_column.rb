class AddBranchColumn < ActiveRecord::Migration
  def change
    add_column :books, :branch, :string
  end
end
