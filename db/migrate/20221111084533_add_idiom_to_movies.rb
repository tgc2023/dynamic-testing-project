class AddIdiomToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :idiom, :integer, default: 0, null: false
  end
end
