class Deal < ApplicationRecord
  # has_many :properties, dependent: :destroy
  ###########################################
  has_one :property, dependent: :destroy
  # accepts_nested_attributes_for :property
  has_one :financial
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
