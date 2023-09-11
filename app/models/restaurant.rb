class Restaurant < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses

  VALID_ICONS = %w[wallet2 cash-stack].freeze

  validates :name, presence: true
  validates :icon, inclusion: { in: VALID_ICONS, message: '%{value} is not a valid icon' }
end
