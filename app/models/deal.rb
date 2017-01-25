class Deal < ApplicationRecord
  has_one :property
  has_one :financial
  has_many :tenants, dependent: :destroy
end
