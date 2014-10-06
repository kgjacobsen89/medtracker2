class CreatePatientMedications < ActiveRecord::Migration
  def change
    create_table :patient_medications do |t|
      t.float :dosage
      t.string :dosage_unit
      t.integer :periodicity
      t.string :periodicity_unit
      t.integer :duration
      t.string :duration_unit
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
