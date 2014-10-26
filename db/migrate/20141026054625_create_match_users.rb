class CreateMatchUsers < ActiveRecord::Migration
  def change
    create_table :match_users, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.uuid :match_id, null: false
      t.boolean :revealed, default: false, null: false
    end
  end
end
