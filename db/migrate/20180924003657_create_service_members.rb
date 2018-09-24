class CreateServiceMembers < ActiveRecord::Migration
  def change
    create_table :service_members do |t|

      t.timestamps null: false
    end
  end
end
