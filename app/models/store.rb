# frozen_string_literal: true

class Store < ApplicationRecord
  enum category: { Bebestible: 0, Comestibles: 1, Souvenir: 2 }
  enum unit_value: { Kg: 0, Gramos: 1, Litros: 2, Cc: 3 }
  validates :price, :category, :weight_volume, :unit_value, presence: true
end
