class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      t.string :facebook_uid, null: false, index: { unique: true, case_sensitive: false }
      t.timestamps
    end
  end
end
