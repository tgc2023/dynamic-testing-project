# frozen_string_literal: true

require 'test_helper'

class ReservasControllerTest < ActionDispatch::IntegrationTest
  def setup
    movie = Movie.create(title: 'Matrix')
    MovieTime.create(room: 5, date_start: Date.new(2000, 11, 10),
                     date_end: Date.new(2000, 11, 12), time: 'TANDA',
                     movie_id: movie.id)
  end

  def teardown
    Reserva.destroy_all
    MovieTime.destroy_all
    Movie.destroy_all
  end
  test 'Posting a new reserva and same seat' do
    assert_changes 'Reserva.count' do
      post new_reserva_url(5, '2000-11-12', 'TANDA'),
           params: { reservation_seats: 'C-3', name: 'Diego' }
      post new_reserva_url(5, '2000-11-12', 'TANDA'),
           params: { reservation_seats: 'C1', name: 'Diego 3' }
      post new_reserva_url(5, '2000-11-12', 'TANDA'),
           params: { reservation_seats: 'C-3', name: 'Diego 2' }
    end
  end

  test 'Posting a new reserva with blank parameters and wrong seat' do
    assert_no_changes 'Reserva.count' do
      post new_reserva_url(5, '2000-11-12', 'TANDA'),
           params: { reservation_seats: 'C-3' }
      post new_reserva_url(5, '2000-11-12', 'TANDA'),
           params: { reservation_seats: '', name: 'Diego 2' }
    end
  end

  test 'Getting a new reserva' do
    get new_reserva_url(5, '2000-11-12', 'TANDA')
    assert_response :success
  end
end
