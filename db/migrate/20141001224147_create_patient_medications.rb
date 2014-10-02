class CreatePatientMedications < ActiveRecord::Migration
  def change
    create_table :patient_medications do |t|
      t.integer :dosage
      t.integer :periodicity
      t.integer :duration
      t.date :start_date
      t.date :end_date
      t.string :instruction
      t.references :patient, index: true
      t.references :medication, index: true
      t.references :doctor, index: true 

      t.timestamps
    end
  end
end
