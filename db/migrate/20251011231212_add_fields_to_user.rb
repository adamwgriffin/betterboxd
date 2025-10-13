class AddFieldsToUser < ActiveRecord::Migration[8.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :username, null: false
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :website
      t.text :bio
    end

    add_index :users, :username, unique: true
  end
end
