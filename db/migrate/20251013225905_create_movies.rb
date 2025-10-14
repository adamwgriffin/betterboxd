class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.date :release_date
      t.string :tagline
      t.text :overview
      t.string :poster_path
      t.timestamps
    end
  end
end
