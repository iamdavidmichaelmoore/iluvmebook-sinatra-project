class AddServiceMemberIdColumn < ActiveRecord::Migration
  def change
    add_column :books, :service_member_id, :integer
  end
end
