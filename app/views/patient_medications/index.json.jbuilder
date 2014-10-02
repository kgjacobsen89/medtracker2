json.array!(@patient_medications) do |patient_medication|
  json.extract! patient_medication, :id, :dosage, :periodicity, :duration, :start_date, :end_date, :instruction, :patient_id, :medication_id
  json.url patient_medication_url(patient_medication, format: :json)
end
