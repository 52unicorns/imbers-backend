json.array! @messages do |message|
  json.(message, :id, :created_at)

  json.user do |user|
    user.(message.user, :id, :first_name, :avatar_url)
  end
end
