module MatchMaking
  class Base
    class << self
      def client
        Neography::Rest.new
      end

      def call(user)
        format_matches(query(user.facebook_uid))
      end

      def format_matches(matches)
        matches['data'].map do |record|
          record[0]
        end
      end
    end
  end
end
