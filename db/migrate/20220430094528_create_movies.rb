class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.string :poster_url_text
      t.decimal :rating, precision: 3, scale: 1

      t.timestamps
    end
  end
end
