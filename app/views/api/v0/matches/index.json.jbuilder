json.array! @matches do |match|
  user = match.users.find { |u| u.id != current_user.id }

  json.(match, :id, :created_at)

  json.revealed match.revealed?

  json.user do |u|
    u.(user, :id, :first_name, :avatar_url)
  end
end
