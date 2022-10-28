# frozen_string_literal: true

class Store < ApplicationRecord
  enum category: { Bebestible: 0, Comestibles: 1, Souvenir: 2 }
  enum unit_value: { Kg: 0, Gramos: 1, Litros: 2, Cc: 3 }
  validates :category, :unit_value, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :weight_volume, presence: true, numericality: { only_integer: true, greater_than: 1 }
  validate :validate_category_unit_value

  def validate_category_unit_value
    puts(category, unit_value, (category="Bebestible") && (unit_value == "Kg" || unit_value == "Gramos" ))
    if (category="Bebestible") && (unit_value == "Kg" || unit_value == "Gramos" )
      errors.add(:none_existing,
                 'Unidad inválida para un Bebestible
                 ')

    elsif category="Comestibles" && (unit_value == "Litros" || unit_value != "Cc" )
      errors.add(:none_existing,
                 'Unidad inválida para un Comestible
                 ')
    end
  end
end
