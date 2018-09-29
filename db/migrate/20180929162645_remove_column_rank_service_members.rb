class RemoveColumnRankServiceMembers < ActiveRecord::Migration
  def change
    remove_column :service_members, :rank, :string
  end
end
