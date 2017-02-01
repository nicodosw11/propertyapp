class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :investments, dependent: :nullify
  has_many :deals, through: :investments

  #for Active Admin
  def name
    "#{id} - #{first_name} #{last_name}"
  end
end
