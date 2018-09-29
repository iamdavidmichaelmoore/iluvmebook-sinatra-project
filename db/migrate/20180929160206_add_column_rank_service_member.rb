class AddColumnRankServiceMember < ActiveRecord::Migration
  def change
    add_column :service_members, :rank, :string
  end
end
