class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :name
      t.string :issue_date
      t.string :issuing_command_unit
      t.string :location
      t.timestamps null: false
    end
  end
end
