class PatientMedication < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medication
  belongs_to :doctor
end
