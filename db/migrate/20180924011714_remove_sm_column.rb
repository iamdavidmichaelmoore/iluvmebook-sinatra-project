class RemoveSmColumn < ActiveRecord::Migration
  def change
    remove_column :service_members, :branch
  end
end
