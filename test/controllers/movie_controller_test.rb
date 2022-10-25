# frozen_string_literal: true

require 'test_helper'

class MovieControllerTest < ActionDispatch::IntegrationTest
  def setup; end

  def teardown
    MovieTime.destroy_all
    Movie.destroy_all
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
