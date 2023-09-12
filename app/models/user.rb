class User < ApplicationRecord
  validates :name, presence: true
  has_many :expenses
  has_many :restaurants
end
