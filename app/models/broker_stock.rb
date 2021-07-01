class BrokerStock < ApplicationRecord
  belongs_to :broker
  has_many :user_transactions, dependent: :destroy
  has_many :buyers, through: :user_transactions
  validates :symbol, presence: true
  validates :company_name, presence: true

  def self.search(search)
    if search
      where(['company_name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
