class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :restaurants

  validates :author, presence: true
  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: true
end
