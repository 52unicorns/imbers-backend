module SpecSupport
  module Neo4jHelpers
    extend ActiveSupport::Concern

    included do
      def create_user_node(record)
        node = Neography::Node.create_unique('user_index', 'uid', record.facebook_uid,
                                             'uid' => record.facebook_uid,
                                             'name' => record.full_name)
        node.add_to_index('user_index', 'uid', record.facebook_uid)
        node
      end

      def create_like_node(record)
        node = Neography::Node.create_unique('like_index', 'uid', record.id,
                                             'uid' => record.id,
                                             'name' => record.id)
        node.add_to_index('like_index', 'uid', record.id)
        node
      end
    end
  end
end
