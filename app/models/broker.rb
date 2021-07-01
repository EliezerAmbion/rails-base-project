class Broker < User
  has_many :broker_stocks, dependent: :destroy

  after_create :send_welcome_email

  def send_welcome_email
    WelcomeMailer.welcome_email(self).deliver_now
  end
end
