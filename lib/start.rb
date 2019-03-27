require_relative 'checkout'

rules = []
percentage_rule = PercentageRule.new(
  percentage_discount: 10, eligible_amount: 60
)
rules << percentage_rule
bulk_rule = BulkRule.new(
  product_code: '001', quantity_eligible: 2, discounted_price: 8.50
)
rules << bulk_rule

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
