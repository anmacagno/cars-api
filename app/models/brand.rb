# frozen_string_literal: true

class Brand < ApplicationRecord
  has_many :models, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def average_price
    prices = models.filter_map(&:average_price)
    return 0 if prices.empty?

    prices.sum / prices.size
  end
end
