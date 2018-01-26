class Deal < ApplicationRecord
  include Friendlyable
  # when using set.pct_funded!
  # attr_accessor :pct_funded
  # or
  # attr_reader :pct_funded
  # attr_writer :pct_funded

  validates :street, presence: true
  validates :city, presence: true
  # validates :district, presence: true
  validates :postcode, presence: true
  validates :property_type, presence: true
  validates :occupancy, presence: true
  validates :nb_rooms, presence: true
  validates :nb_bedrooms, presence: true
  validates :nb_bathrooms, presence: true
  validates :surface, presence: true

  # has_many :properties, dependent: :destroy
  ###########################################
  has_one :property, dependent: :destroy
  # accepts_nested_attributes_for :property
  has_many :tenants, dependent: :destroy
  accepts_nested_attributes_for :tenants, allow_destroy: true, reject_if: proc { |att| att['first_name'].blank? && att['last_name'].blank?}
  # accepts_nested_attributes_for :tenants, allow_destroy: true, reject_if: :all_blank
  # has_many :investments, dependent: :nullify
  # has_many :investments, dependent: :delete_all
  has_many :investments, dependent: :destroy
  has_many :users, through: :investments
  has_many :roles, dependent: :delete_all
  has_many :photos, dependent: :destroy

  geocoded_by :full_address
  after_validation :geocode, if: :street_changed?

  # overriding the getter for interest_rate attribute
  # def interest_rate
    # "#{self[:interest_rate]}%"
    # "#{read_attribute(:interest_rate)}%%"
  # end

  def has_member?(user)
    roles.exists?(user_id: user)
  end

  [:manager, :editor, :viewer].each do |role|
    define_method "has_#{role}?" do |user|
      roles.exists?(user_id: user, role: role)
    end
  end

  def cover_photo(size, cl)
    if self.photos.length > 0
      self.photos[0].image.url(size, cl)
    else
      "photo.jpg"
    end
  end

  def full_address
    "#{street} #{postcode} #{city}"
  end

  def money_raised
    # self.investments.sum(:price)
    investments.blank? ? 0 : investments.sum(:pledge_amount)
  end

  def number_of_supporters
    # self.investments.pluck(:user_id).uniq.length
    investments.pluck(:user_id).uniq.length
  end

  def number_of_backers
    users.uniq.count
  end

  def valuation_discount
    # (100 * self.funding_goal.to_f / self.property_value).round(1) if self.funding_goal.present? && self.property_value.present?
    (100 * funding_goal.to_f / property_value).round(1) if funding_goal.present? && property_value.present?
  end

  def duration_in_months
    duration * 12 if duration.present?
  end

  def resale_value
    property_value * ((1 + (interest_rate / 100)) ** duration) if property_value.present? && duration.present?
  end

  def resale_value_per_unit
    resale_value / max_shares if !resale_value.blank? && !max_shares.blank?
  end

  def expected_yearly_return
    100 * ((resale_value / funding_goal) ** (1 / duration.to_f) - 1) if !resale_value.blank? && !funding_goal.blank? && !duration.blank?
  end

  def gross_margin
    resale_value - funding_goal if !resale_value.blank? && !funding_goal.blank?
  end

  def gross_margin_per_unit
    gross_margin / max_shares if !gross_margin.blank? && !max_shares.blank?
  end

  def percentage_margin
    100 * (resale_value / funding_goal - 1) if !resale_value.blank? && !funding_goal.blank?
  end

  def days_left
    self.end_date.nil? ? 0 : ((self.end_date - Time.zone.now)/(24 * 60 * 60) + 1).to_i
  end

  #percentage funded
  def pct_funded
    # self.pct_funded = (100 * self.money_raised.to_f / self.funding_goal).round(1)
    (100 * self.money_raised.to_f / self.funding_goal).round(1) if !money_raised.blank? && !funding_goal.blank?
  end
  def set_pct_funded!
    self.pct_funded = (100 * self.money_raised.to_f / self.funding_goal).round(1)
  end

  def max_shares
    funding_goal / 1000 if funding_goal.present?
  end

  def available_shares
    max_shares - investments.sum(:shares) if investments
  end

  # #virtual attributes
  # def number_of_backers
  #   @number_of_backers
  # end

  # def number_of_backers=(var)
  #   @number_of_backers = var
  # end

  # # attr_reader
  # def pct_funded
  #   self[:pct_funded]
  # end

  # # attr_writer
  # def pct_funded=(val)
  #   self[:pct_funded] = val
  # end

  # def pct_funded
  #   #return true/false
  # end

  def increased_valuation(i,d)
    (property_value * ((1 + (i / 100)) ** d)) / 1000
  end

  def increased_valuation_margin(i,d)
    increased_valuation(i,d) - (funding_goal / 1000)
  end

  def valuation_yield(i,d)
    # 100 * (((deal.property_value * ((1 + (-0.75 / 100)) ** 12)) / deal.funding_goal) ** (1 / 12.to_f) - 1)
    100 * (((increased_valuation(i,d) * 1000) / funding_goal) ** (1 / d.to_f) - 1)
  end

  def growth_rate(i,d)
    100 * ((property_value * ((1 + (i / 100)) ** d)) / funding_goal - 1)
  end

end


