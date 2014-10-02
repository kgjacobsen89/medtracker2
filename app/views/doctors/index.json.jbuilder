json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :first_name, :last_name, :speciality, :phone_number, :city
  json.url doctor_url(doctor, format: :json)
end
