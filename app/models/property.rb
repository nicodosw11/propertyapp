class Property < ApplicationRecord
  belongs_to :deal
  validates :deal_id, :full_address, presence: true
end
