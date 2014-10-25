class CreateAccessTokens < ActiveRecord::Migration
  def change
    create_table :access_tokens, id: :uuid do |t|
      t.string :token, null: false, index: { unique: true, case_sensitive: false }
      t.integer :expires_in, null: false
      t.uuid :user_id, null: false
      t.timestamps
    end
  end
end
