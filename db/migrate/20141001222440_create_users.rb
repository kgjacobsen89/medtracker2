class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :type

      # pat  + doc stuff
      t.string :first_name
      t.string :last_name
      t.string :phone_number

      # pat stuff
      t.string :sex
      t.date :date_of_birth
      t.string :blood_type
      t.text :allergies

      # doc stuff
      t.string :specialty
      t.string :city

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
