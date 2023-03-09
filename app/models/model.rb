# frozen_string_literal: true

class Model < ApplicationRecord
  belongs_to :brand

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :brand_id }
  validates :average_price, numericality: { greater_than: 100_000, allow_nil: true }

  scope :average_price_greater_than, ->(price) { where('average_price > ?', price) if price.present? }
  scope :average_price_lower_than, ->(price) { where('average_price < ?', price) if price.present? }
end
