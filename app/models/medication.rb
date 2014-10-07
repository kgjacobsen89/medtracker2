class Medication < ActiveRecord::Base
	before_save { |medication| medication.name = medication.name.downcase }
	validates_uniqueness_of :name
	def cap_name
		name.capitalize
	end

	has_many :patient_medications
	has_many :patients, through: :patient_medications 
end
