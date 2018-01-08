class Deal < ApplicationRecord

  validates :street, presence: true
  validates :city, presence: true
  # validates :district, presence: true
  validates :postcode, presence: true
  validates :property_type, presence: true
  validates :occupancy, presence: true
  validates :nb_rooms, presence: true
  validates :nb_bedrooms, presence: true
  validates :nb_bathrooms, presence: true


  # has_many :properties, dependent: :destroy
  ###########################################
  has_one :property, dependent: :destroy
  # accepts_nested_attributes_for :property
  has_many :tenants, dependent: :destroy
  # has_many :investments, dependent: :nullify
  # has_many :investments, dependent: :delete_all
  has_many :investments, dependent: :destroy
  has_many :users, through: :investments
  has_many :roles, dependent: :delete_all
  has_many :photos, dependent: :destroy

  geocoded_by :full_address
  after_validation :geocode, if: :street_changed?

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

  def set_part_value
    if self.nb_investors > 0
      self.valuation.to_f / self.nb_investors.to_f
    else
      self.valuation
    end
  end

end


