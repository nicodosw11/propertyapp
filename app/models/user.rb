class User < ApplicationRecord
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
  has_many :investments, dependent: :nullify
  has_many :deals, through: :investments

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
  #for Active Admin
  def name
    "#{id} - #{first_name} #{last_name}"
  end
end
