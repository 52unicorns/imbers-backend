module Friendship
  module_function

  def create(user, friend)
    user_node   = create_user_node(user)
    friend_node = create_friend_node(friend)
    user_node.both(:friends) << friend_node
  end

  def create_user_node(user)
    node = Neography::Node.create_unique('user_index', 'uid', user.facebook_uid,
                                         'uid' => user.facebook_uid,
                                         'name' => user.full_name)
    node.add_to_index('user_index', 'uid', user.facebook_uid)
    node
  end

  def create_friend_node(friend)
    node = Neography::Node.create_unique('user_index', 'uid', friend['id'],
                                         'uid' => friend['id'],
                                         'name' => friend['name'])
    node.add_to_index('user_index', 'uid', friend['id'])
    node
  end
end
