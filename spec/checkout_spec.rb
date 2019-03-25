require 'percentage_rule'
require 'bulk_rule'
require 'item'
require 'checkout'

describe 'Checkout' do

  context 'when using only PercentageRule' do
    co = Checkout.new([
      BulkRule.new(product_code: '001', quantity_eligible: 2, amount_discounted: 0.75),
      PercentageRule.new(percentage_discount: 10, eligible_amount: 60)
    ])
    co.scan(Item.new('001', 'Lavender heart', 9.25))
    co.scan(Item.new('002', 'Personalised cufflinks', 45))
    co.scan(Item.new('003', 'Kids T-shirt', 19.95))

    it 'returns with discount' do
      expect(co.total).to eq(66.78)
    end
  end

  context 'when using all rules' do
    co = Checkout.new([
      BulkRule.new(product_code: '001', quantity_eligible: 2, amount_discounted: 0.75),
      PercentageRule.new(percentage_discount: 10, eligible_amount: 60)
    ])
    co.scan(Item.new('001', 'Lavender heart', 9.25))
    co.scan(Item.new('002', 'Personalised cufflinks', 45))
    co.scan(Item.new('001', 'Lavender heart', 9.25))
    co.scan(Item.new('003', 'Kids T-shirt', 19.95))

    it 'returns with discount' do
      expect(co.total).to eq(73.76)
    end
  end
end
