class AddColumnCurrentRankBooks < ActiveRecord::Migration
  def change
    add_column :books, :current_rank, :string
  end
end
