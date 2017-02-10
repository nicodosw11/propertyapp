class Property < ApplicationRecord
  belongs_to :deal
  # validates :deal_id, :full_address, presence: true
  #################################################
  # validates_uniqueness_of :deal_id
  validates :full_address, presence: true
end
