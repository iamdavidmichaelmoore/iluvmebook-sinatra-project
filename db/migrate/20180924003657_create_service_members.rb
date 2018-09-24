class CreateServiceMembers < ActiveRecord::Migration
  def change
    create_table :service_members do |t|
      t.string :email
      t.string :password_digest
      t.string :branch
      t.timestamps null: false
    end
  end
end
