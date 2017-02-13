class Investment < ApplicationRecord
  belongs_to :deal
  belongs_to :user
  validates :deal, :user, :price, :shares, presence: true
end
