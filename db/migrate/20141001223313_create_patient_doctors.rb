class CreatePatientDoctors < ActiveRecord::Migration
  def change
    create_table :patient_doctors do |t|
      t.references :patient, index: true
      t.references :doctor, index: true

      t.timestamps
    end
  end
end
