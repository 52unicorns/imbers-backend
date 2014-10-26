user = match.users.find { |u| u.id != current_user.id }
json.call(match, :id, :created_at)
json.revealed match.revealed?


json.user do |u|
  u.call(user, :id, :first_name, :avatar_url)
  if match.revealed?
    u.facebook_url user.facebook_url
  else
    u.facebook_url nil
  end
end
