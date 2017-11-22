class Deal < ApplicationRecord

  validates :street, presence: true
  validates :city, presence: true
  validates :district, presence: true
  validates :postcode, presence: true
  validates :property_type, presence: true
  validates :occupancy, presence: true
  validates :surface, presence: true
  validates :nb_bedrooms, presence: true
  validates :nb_bathrooms, presence: true


  # has_many :properties, dependent: :destroy
  ###########################################
  has_one :property, dependent: :destroy
  # accepts_nested_attributes_for :property
  has_many :tenants, dependent: :destroy
  has_many :investments, dependent: :nullify
  has_many :users, through: :investments

  def set_part_value
    if self.nb_investors > 0
      self.valuation.to_f / self.nb_investors.to_f
    else
      self.valuation
    end
  end

end


