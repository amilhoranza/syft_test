require 'bulk_rule'
require 'item'

describe 'BulkRule' do
  let(:rule) { bulk_rule = BulkRule.new(product_code: '001', quantity_eligible: 2, amount_discounted: 1) }

  context 'when eligible calculates discounts' do
    let(:items) do
      [
        Item.new('001', 'Item 1', 10),
        Item.new('002', 'Item 2', 20),
        Item.new('001', 'Item 1', 10)
      ]
    end

    it 'returns with discount' do
      expect(rule.calculate_discount(items).map(&:price).reduce(0, :+)).to eq(38)
    end
  end

  context 'when not eligible does not calculates discounts' do
    let(:items) do
      [
        Item.new('001', 'Item 1', 10),
        Item.new('002', 'Item 2', 20),
        Item.new('003', 'Item 3', 30)
      ]
    end

    it 'returns without discount' do
      expect(rule.calculate_discount(items)).to eq(60)
    end
  end
end
