class Deal < ApplicationRecord
  has_many :properties
  has_one :financial
  has_many :tenants, dependent: :destroy
  has_many :investments, dependent: :nullify
  has_many :users, through: :investments
end
