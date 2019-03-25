require_relative 'percentage_rule'
require_relative 'bulk_rule'
require_relative 'item'

class Checkout

  attr_reader :promotional_rules

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total
    total_discount = 0
    promotional_rules.each do |rule|
      rule.calculate_discount(@items)
    end
    total_items.round(2)
  end

  private

  def total_items
    @items.map(&:price).reduce(0, :+)
  end
end
