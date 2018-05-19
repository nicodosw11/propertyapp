class Investment < ApplicationRecord
  attr_readonly :price
  belongs_to :deal
  belongs_to :user
  # TODO belongs_to :investor, class_name: "User"
  validates :deal, :user, :pledge_amount, :shares, presence: true
  validates :shares, numericality: true
  validates :pledge_amount, numericality: {greater_than: 0}

  scope :validated, -> {
    where(:status => 'approved')
  }

  def price
    1000
  end
  def pledge_amount
    self[:pledge_amount] = self.price * self.shares
  end
  def full_details
    "#{deal.full_address} - #{shares} shares - total #{pledge_amount}€"
  end
  def self.search(search)
    if search
      joins(:deal).where('LOWER(deals.street) LIKE LOWER(?)', "%#{search}%")
    else
      where(nil)
    end
  end
end
