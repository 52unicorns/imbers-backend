module Like
  module_function

  def create(user, like)
    user_node = find_user_node(user)
    like_node = crete_like_node(like)
    user_node.outgoing(:likes) << like_node
  end

  def find_user_node(user)
    Neography::Node.find('user_index', 'uid', user.facebook_uid)
  end

  def crete_like_node(like)
    node = Neography::Node.create_unique('like_index', 'uid', like['id'],
                                         'uid' => like['id'],
                                         'name' => like['name'])
    node.add_to_index('like_index', 'uid', like['id'])
    node
  end
end
