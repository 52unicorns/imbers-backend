json.array! @messages do |message|
  json.call(message, :id, :created_at, :body)

  json.user do |user|
    user.call(message.user, :id, :first_name, :avatar_url)
  end
end
