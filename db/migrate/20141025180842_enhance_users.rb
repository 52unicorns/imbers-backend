class EnhanceUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :interested_in
      t.string :location
    end
  end
end
