class AddColumnsServiceMemberFirstLastName < ActiveRecord::Migration
  def change
    add_column :service_members, :first_name, :text
    add_column :service_members, :last_name, :text
  end
end
