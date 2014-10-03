class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      # t.string :first_name
      # t.string :last_name
      # t.string :speciality
      # t.string :phone_number
      # t.string :city

      t.timestamps
    end
  end
end
