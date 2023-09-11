class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :restaurants

  validates :author, presence: true
  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: true

  validate :restaurants_is_not_empty

  after_save :update_total_expense

  private

  def restaurants_is_not_empty
    return unless restaurants.is_a?(Array) && (restaurants.empty? || restaurants.all?(&:empty?))
    return unless restaurants.is_a?(Restaurant) && restaurants.valid?

    errors.add(:restaurants, 'should not be empty')
  end

  def update_total_expense
    restaurants.each(&:save)
  end
end
