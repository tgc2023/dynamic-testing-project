class Store < ApplicationRecord
  enum category: { Bebestible: 0, Comestibles: 1, Souvenir: 2 }
  enum unit_value: { Kg: 0, Gramos: 1, Litros: 2, Cc: 3 }
  validates_presence_of %i[price category weight_volume unit_value]
end
