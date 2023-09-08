class Dog < ApplicationRecord
  enum cuteness_level: [:cute, :very_cute, :extremely_cute]
  enum hair_length: [:short_haired, :long_haired]

  belongs_to :child
end
