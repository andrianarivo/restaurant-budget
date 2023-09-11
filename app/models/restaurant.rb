class Restaurant < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses

  validates :name, presence: true

  before_save :update_total_expense

  private

  def update_total_expense
    self.total_expense = expenses.reduce(0.0) do |acc, item|
      acc + item.amount
    end
  end
end
