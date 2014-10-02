json.array!(@patients) do |patient|
  json.extract! patient, :id, :first_name, :last_name, :phone_number, :sex, :date_of_birth, :user_id
  json.url patient_url(patient, format: :json)
end
