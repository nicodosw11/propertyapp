class Investment < ApplicationRecord
  belongs_to :deal
  belongs_to :user
  validates :deal, :user, :description, :price, :shares, presence: true
end
