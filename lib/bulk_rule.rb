require_relative 'base_rule'
# BulkRule
class BulkRule < BaseRule
  def initialize(product_code:, quantity_eligible:, discounted_price:)
    @product_code = product_code
    @quantity_eligible = quantity_eligible
    @discounted_price = discounted_price
  end

  def calculate_discount(items)
    local_items = items.select do |item|
      item.code == product_code
    end

    return total_items(items) if local_items.size < quantity_eligible

    items.each do |item|
      item.price = discounted_price if item.code == product_code
    end
  end

  private

  attr_reader :product_code, :quantity_eligible, :discounted_price
end
