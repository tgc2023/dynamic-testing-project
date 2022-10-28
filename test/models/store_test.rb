# frozen_string_literal: true

require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  def teardown
    Store.destroy_all
  end

  test 'Store with invalid parameters' do
    product = Store.create(category: 0, price: 10, weight_volume: 10, unit_value: 0)
    assert_equal(false, product.valid?)
  end
  test 'Store with valid parameters' do
    product = Store.create(category: 1, price: 10, weight_volume: 10, unit_value: 0)
    assert_equal(true, product.valid?)
  end

  test 'Editar Store' do
    product = Store.create(category: 0, price: 10, weight_volume: 10, unit_value: 0)
    product.update(price: 100)
    assert_equal(100, product.price)
  end
end
