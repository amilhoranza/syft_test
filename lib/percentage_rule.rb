require_relative 'base_rule'

class PercentageRule < BaseRule
  def initialize(percentage_discount:, eligible_amount:)
    @percentage_discount = percentage_discount
    @eligible_amount = eligible_amount
  end

  attr_reader :percentage_discount, :eligible_amount

  def calculate_discount(items)
    total_price_items = total_items(items)
    return total_price_items if total_price_items < eligible_amount
    items.each { |item| item.price -= ((item.price.to_f / 100) * percentage_discount) }
  end
end
