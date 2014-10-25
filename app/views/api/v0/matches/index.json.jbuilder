json.array! @matches do |match|
  json.(match, :id, :created_at)
  user = match.user1_id == current_user.id ? match.user1 : match.user2

  json.user do |u|
    u.(user, :id, :first_name)
  end
end
