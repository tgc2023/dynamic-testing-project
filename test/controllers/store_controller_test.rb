# frozen_string_literal: true

require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest

  def teardown
    Store.destroy_all
  end

  test 'post new product' do
    assert_difference 'Store.count' do
      post stores_url,
           params: { store: { price: 2, category: 'Bebestible', weight_volume: 3, unit_value: 'Litros' } }
    end
  end

  test 'post new product with incorrect combination category and unit' do
    assert_no_changes 'Store.count' do
      post stores_url,
           params: { store: { price: 2, category: 'Bebestible', weight_volume: 3, unit_value: 'Kg' } }
      post stores_url,
           params: { store: { price: 2, category: 'Comestibles', weight_volume: 3, unit_value: 'Litros' } }
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

  test 'should be update success' do
    assert_difference 'Store.count' do
      product = Store.create(category: 1, price: 10, weight_volume: 10, unit_value: 0)
      put store_url(id:product.id, store: {category: "Bebestible", price: 10, weight_volume: 10, unit_value: "Litros"})
    end
  end

  test 'should be update failure' do
    assert_difference 'Store.count' do
      product = Store.create(category: 1, price: 10, weight_volume: 10, unit_value: 0)
      put store_url(id:product.id, store: {category: "Bebestible", price: 10, unit_value: "Kg"})
    end
  end

  test 'should be delete success' do
    assert_no_changes 'Store.count' do
      product = Store.create(category: 1, price: 10, weight_volume: 10, unit_value: 0)
      delete store_url(id:product.id)
    end
  end

  test 'should get new' do
    get new_store_url
    assert_response :success
  end
 

  test 'should get filter' do
    get products_by_category_url(0)
    assert_response :success
  end
end
