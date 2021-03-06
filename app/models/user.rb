class User < ApplicationRecord
  # after_create :send_welcome_email
  after_save :send_welcome_email, :if => proc { |l| l.confirmed_at_changed? && l.confirmed_at_was.nil? }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable

  validate :password_complexity
  # validates_uniqueness_of :phone_number
  # validates :phone_number, phone: { possible: false, allow_blank: false, types: [:mobile] }
  # has_many :investments, dependent: :nullify
  has_many :investments, dependent: :destroy
  has_many :deals, through: :investments
  has_many :roles

  scope :excluding_archived, lambda { where(archived_at: nil) }
  scope :external, -> {
    where(:admin => false)
  }

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

  def total_contributions
    self.investments.sum(:pledge_amount)
  end

  def backed_projects
    arr = []
    self.investments.each do |investment|
      arr.push(investment.deal)
    end
    arr.uniq
  end

  # def first_confirmation?
  #   previous_changes[:confirmed_at] && previous_changes[:confirmed_at].first.nil?
  # end

  # Override Devise::Confirmable#after_confirmation
  # def after_confirmation
  #   send_welcome_email if first_confirmation?
  # end

  def generate_pin
    self.pin = SecureRandom.hex(2)
    self.phone_verified = false
    save
  end
  def send_pin
    @client = Twilio::REST::Client.new
    @client.messages.create(
      from: ENV['MY_TWILIO_PHONE_NUMBER'],
      to: self.phone_number,
      body: "Votre code pin est #{self.pin}"
    )
  end
  def verify_pin(entered_pin)
    update(phone_verified: true) if self.pin == entered_pin
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
  #for Active Admin
  def name
    "#{id} - #{first_name} #{last_name}"
  end
  def password_complexity
    if password.present?
       if !password.match(/(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/)
         errors.add(:password, :password_complexity)
       end
    end
  end
end
