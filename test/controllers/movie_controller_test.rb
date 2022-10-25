# frozen_string_literal: true

require 'test_helper'

class MovieControllerTest < ActionDispatch::IntegrationTest
  def setup
    @movie = Movie.create(title: 'Movie')
  end

  def teardown
    MovieTime.destroy_all
    Movie.destroy_all
  end

  test 'post a new movie valid parameter' do
    assert_difference 'Movie.count' do
      post create_movie_url(title: 'title 1')
    end
  end

  test 'post a new movie blank parameter' do
    assert_no_changes 'Movie.count' do
      post create_movie_url
    end
  end

  test 'create movie_time with valid paremters' do
    assert_difference 'MovieTime.count' do
      post new_movie_time_url(movie_time: { room: 3, date_start: Date.new(2000, 11, 10),
                                            date_end: Date.new(2000, 11, 12), time: 'TANDA',
                                            movie_id: @movie.id })
    end
  end

  test 'create movie_time with invalid paremters' do
    assert_no_changes 'MovieTime.count' do
      post new_movie_time_url(movie_time: { room: 3, date_start: Date.new(2000, 11, 12),
                                            date_end: Date.new(2000, 11, 10), time: 'TANDA',
                                            movie_id: @movie.id })
    end
  end

  test 'should get new' do
    get movie_new_url
    assert_response :success
  end

  test 'should get filter' do
    get movies_by_date_url(Date.new(2022, 10, 10))
    assert_response :success
  end
end
