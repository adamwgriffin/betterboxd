class AddFieldsToUser < ActiveRecord::Migration[8.0]
  def change
    change_table :users, bulk: true do |t|
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.string :location
      t.string :website
      t.text :bio
    end
  end
end
