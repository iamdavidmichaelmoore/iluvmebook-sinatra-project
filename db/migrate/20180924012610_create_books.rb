class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :unit_name
      t.string :security_clearance_level
      t.string :firstline_supervisor_name
      t.string :firstline_supervistor_email
      t.string :firstline_supervistor_phone
      t.string :commander_name
      t.string :commander_email
      t.string :commander_phone
    end
  end
end
