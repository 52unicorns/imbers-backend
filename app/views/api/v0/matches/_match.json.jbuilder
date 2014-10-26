user = match.users.find { |u| u.id != current_user.id }
json.call(match, :id, :created_at)
json.revealed match.revealed?

json.user do |u|
  u.call(user, :id, :first_name, :avatar_url)
end
