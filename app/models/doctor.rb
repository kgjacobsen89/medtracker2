class Doctor < User
	has_many :patient_medications
	has_many :patients, through: :patient_medications
	has_many :patient_doctors
	has_many :patients, through: :patient_doctors

	accepts_nested_attributes_for :patient_doctors
	accepts_nested_attributes_for :patient_medications 
end
