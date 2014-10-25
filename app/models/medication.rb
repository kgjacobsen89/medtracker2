class Medication < ActiveRecord::Base
	# before_save do  |medication| 
		

	# validates_uniqueness_of :name

	def cap_name
		name.capitalize
	end

	has_many :patient_medications
	has_many :patients, through: :patient_medications 
end
