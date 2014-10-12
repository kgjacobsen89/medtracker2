class Patient < User
	has_many :patient_medications
	has_many :medications, through: :patient_medications
	has_many :patient_doctors
	has_many :doctors, through: :patient_doctors

	accepts_nested_attributes_for :patient_doctors
	accepts_nested_attributes_for :patient_medications

	def name
		"#{first_name} #{last_name}"
	end
end
