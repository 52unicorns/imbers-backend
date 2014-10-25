class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches, id: :uuid do |t|
      t.uuid :user1_id, null: false, references: :users
      t.uuid :user2_id, null: false, references: :users
      t.timestamps
    end
  end
end
