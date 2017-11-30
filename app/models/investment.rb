class Investment < ApplicationRecord
  belongs_to :deal
  belongs_to :user
  # TODO belongs_to :investor, class_name: "User"
  validates :deal, :user, :price, :shares, presence: true
end
