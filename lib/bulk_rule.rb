require_relative 'base_rule'
# BulkRule
class BulkRule < BaseRule
  def initialize(product_code:, quantity_eligible:, amount_discounted:)
    @product_code = product_code
    @quantity_eligible = quantity_eligible
    @amount_discounted = amount_discounted
  end

  def calculate_discount(items)
    local_items = items.select do |item|
      item.code == product_code
    end

    return total_items(items) if local_items.size < quantity_eligible

    items.each do |item|
      item.price = (item.price - amount_discounted) if item.code == product_code
    end
  end

  private

  attr_reader :product_code, :quantity_eligible, :amount_discounted
end
