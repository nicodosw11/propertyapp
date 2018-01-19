class Tenant < ApplicationRecord
  belongs_to :deal, optional: true
  validates :first_name, :last_name, :age, :gender, presence: true
end
