class Investment < ApplicationRecord
  belongs_to :deal
  belongs_to :user
  validates :deal_id, :user_id, :description, :amount, presence: true
end
