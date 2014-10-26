class RemoveUsersFromMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :user1_id, :uuid
    remove_column :matches, :user2_id, :uuid
  end
end
