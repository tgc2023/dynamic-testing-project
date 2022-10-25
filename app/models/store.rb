# frozen_string_literal: true

class Store < ApplicationRecord
  enum category: { Bebestible: 0, Comestibles: 1, Souvenir: 2 }
  enum unit_value: { Kg: 0, Gramos: 1, Litros: 2, Cc: 3 }
  validates :category, :weight_volume, :unit_value, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
