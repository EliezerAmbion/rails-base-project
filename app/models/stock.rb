class Stock < ApplicationRecord
  validates :symbol, presence: true, uniqueness: true
  validates :company_name, presence: true

  def self.search(search)
    if search
      where(['company_name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
