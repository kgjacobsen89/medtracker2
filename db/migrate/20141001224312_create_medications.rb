class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name

      t.timestamps
    end
    
    add_index :medications, :name, unique: true
  end
end
