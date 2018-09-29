class UpdateBooksTable < ActiveRecord::Migration
  def change
    rename_column :books, :firstline_supervistor_email, :firstline_supervisor_email
    rename_column :books, :firstline_supervistor_phone, :firstline_supervisor_phone
  end
end
