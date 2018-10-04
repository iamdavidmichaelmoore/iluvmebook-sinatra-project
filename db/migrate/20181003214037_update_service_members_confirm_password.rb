class UpdateServiceMembersConfirmPassword < ActiveRecord::Migration
  def change
    add_column :service_members, :confirm_password, :string
  end
end
