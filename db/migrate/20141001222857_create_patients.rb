class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :sex
      t.date :date_of_birth
      t.string :blood_type

      t.timestamps
    end
  end
end
