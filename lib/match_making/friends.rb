module MatchMaking
  class Friends < Base
    def self.call(user)
      uid = user.facebook_uid
      matches = client.execute_query <<-QUERY
        MATCH (user { uid: '#{uid}' })-[:friends*2..2]-(friend_of_friend)
        WHERE NOT (user)-[:friends]-(friend_of_friend)
              AND NOT user=friend_of_friend
              AND NOT (user)-[:match]-(friend_of_friend)
        RETURN friend_of_friend.uid, COUNT(*)
        ORDER BY COUNT(*) DESC , friend_of_friend.uid
      QUERY

      format_matches(matches)
    end
  end
end
