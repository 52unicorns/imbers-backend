class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.uuid :match_id, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
