class Deal < ApplicationRecord
  has_one :property
  has_one :financial
end
