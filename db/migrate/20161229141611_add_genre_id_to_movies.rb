class AddGenreIdToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :genre_id, :integer
  end
end
