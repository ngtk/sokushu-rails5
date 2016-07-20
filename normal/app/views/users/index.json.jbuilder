json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :verified
  json.url user_url(user, format: :json)
end
