json.array!(@patient_doctors) do |patient_doctor|
  json.extract! patient_doctor, :id, :patient_id, :doctor_id
  json.url patient_doctor_url(patient_doctor, format: :json)
end
