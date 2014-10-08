class Medication < ActiveRecord::Base
	before_save do  |medication| 
		begin 
			medication.name = medication.name.strip.downcase 
		rescue "Name has already been taken"
			redirect_to new_patient_medication_path
		end
	end

	validates_uniqueness_of :name

	def cap_name
		name.capitalize
	end

	has_many :patient_medications
	has_many :patients, through: :patient_medications 
end
