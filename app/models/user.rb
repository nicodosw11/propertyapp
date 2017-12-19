class User < ApplicationRecord
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
  has_many :investments, dependent: :nullify
  has_many :deals, through: :investments
  has_many :roles

  scope :excluding_archived, lambda { where(archived_at: nil) }

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

  def archive
    self.update(archived_at: Time.now)
  end

  def active_for_authentication?
    super && archived_at.nil?
  end

  def inactive_message
    archived_at.nil? ? super : :archived
  end

  def role_on(deal)
    roles.find_by(deal_id: deal).try(:name)
  end

  def full_name
    "#{first_name} #{last_name}"
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
