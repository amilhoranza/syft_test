require_relative 'base_rule'
# class OneFreeRule
class OneFreeRule < BaseRule
  def initialize(product_code:, quantity_eligible:, amount_discounted:)
    @product_code = product_code
    @quantity_eligible = quantity_eligible.to_f
    @amount_discounted = amount_discounted
  end

  def calculate_discount(items)
    total_price_items = total_items(items)

    return total_price_items if items_eligible(items) < quantity_eligible

    total_discount = times_discount(items) * amount_discounted
    total_price_items - total_discount.to_f
  end

  private

  def items_eligible(items)
    items.select { |item| item.code == product_code }.size
  end

  def times_discount(items)
    (items_eligible(items) / quantity_eligible).to_i
  end

  attr_reader :product_code, :quantity_eligible, :amount_discounted
end
