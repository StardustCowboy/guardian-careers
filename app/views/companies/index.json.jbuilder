json.array!(@companies) do |company|
  json.extract! company, :id, :name, :address, :longitude, :latitude, :email, :user_id
  json.url company_url(company, format: :json)
end
