class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.datetime :released_at
      t.string :imdb_url

      t.timestamps
    end
  end
end
