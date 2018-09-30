class AddColumnBookIdAwards < ActiveRecord::Migration
  def change
    add_column :awards, :book_id, :integer
  end
end
