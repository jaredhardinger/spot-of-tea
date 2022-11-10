class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas
  enum status: [:active, :cancelled]
  
  validates_presence_of :title,
                        :price, 
                        :status,
                        :frequency
end