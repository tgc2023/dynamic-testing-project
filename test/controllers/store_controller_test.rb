# frozen_string_literal: true

require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  def teardown
    Store.destroy_all
  end

  test 'post new product' do
    assert_difference 'Store.count' do
      post stores_url,
           params: { store: { price: 2, category: 'Bebestible', weight_volume: 3, unit_value: 'Kg' } }
    end
  end

  test 'post new product with invalid paremeters' do
    assert_no_changes 'Store.count' do
      post stores_url,
           params: { store: { price: -1, category: 'Bebestible', weight_volume: 3, unit_value: 'Kg' } }
    end
  end

  test 'should get index' do
    get stores_url
    assert_response :success
  end
  test 'should get new' do
    get new_store_url
    assert_response :success
  end
end
