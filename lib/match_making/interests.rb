module MatchMaking
  class Interests < Base
    def self.query(uid)
      client.execute_query <<-QUERY
        MATCH (user { uid: '#{uid}' })-[:likes]->(stuff)<-[:likes]-(match)
        WHERE NOT user=match
              AND NOT (user)-[:match]-(match)
        RETURN match.uid, COUNT(*)
        ORDER BY COUNT(*) DESC , match.uid
      QUERY
    end
  end
end
