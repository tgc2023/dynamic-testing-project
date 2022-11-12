# frozen_string_literal: true

class AddAdultFilmToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :adult_film, :boolean, default: false, null: false
  end
end
