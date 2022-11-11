# frozen_string_literal: true

require 'test_helper'

class MovieTimeTest < ActiveSupport::TestCase
  def setup
    @movie = Movie.create(title: 'Movie', idiom: 'espanol', adult_film: false)
    MovieTime.create(room: 5, date_start: Date.new(2022, 10, 10),
                     date_end: Date.new(2022, 10, 12),
                     time: 'TANDA', movie_id: @movie.id)
  end

  def teardown
    MovieTime.destroy_all
    Movie.destroy_all
  end

  test 'MovieTime creada con día de inicio después que el de termino' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 10, 12),
                                  date_end: Date.new(2022, 10, 10),
                                  time: 'TANDA', movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end
end
