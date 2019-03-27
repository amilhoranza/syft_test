require_relative 'checkout'

rules = []
bulk_rule = BulkRule.new(
  product_code: '001', quantity_eligible: 2, amount_discounted: 0.75
)
rules << bulk_rule

percentage_rule = PercentageRule.new(
  percentage_discount: 10, eligible_amount: 60
)
rules << percentage_rule

co = Checkout.new(rules)
co.scan(Item.new('001', 'Lavender heart', 9.25))
co.scan(Item.new('002', 'Personalised cufflinks', 45))
co.scan(Item.new('003', 'Kids T-shirt', 19.95))
puts co.total

co = Checkout.new(rules)
co.scan(Item.new('001', 'Lavender heart', 9.25))
co.scan(Item.new('003', 'Kids T-shirt', 19.95))
co.scan(Item.new('001', 'Lavender heart', 9.25))
puts co.total

co = Checkout.new(rules)
co.scan(Item.new('001', 'Lavender heart', 9.25))
co.scan(Item.new('002', 'Personalised cufflinks', 45))
co.scan(Item.new('001', 'Lavender heart', 9.25))
co.scan(Item.new('003', 'Kids T-shirt', 19.95))
puts co.total
