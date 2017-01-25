class Tenant < ApplicationRecord
  belongs_to :deal
  validates :deal_id, :first_name, :last_name, presence: true
end
