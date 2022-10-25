# frozen_string_literal: true

require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  def teardown
    Store.destroy_all
  end

  test 'Store creada con parametros validos' do
    product = Store.create(category: 0, price: 10, weight_volume: 10, unit_value: 0)
    assert_equal(true, product.valid?)
  end
end
