require 'percentage_rule'
require 'item'

describe 'PercentageRule' do
  let(:items) do
    [
      Item.new('001', 'Item 1', 10),
      Item.new('001', 'Item 2', 20),
      Item.new('002', 'Item 3', 30)
    ]
  end

  context 'when eligible calculates discounts' do
    let(:rule) { PercentageRule.new(percentage_discount: 15, eligible_amount: 50) }

    it 'returns 15%' do
      expect(rule.calculate_discount(items).map(&:price).reduce(0, :+)).to eq(51)
    end
  end

  context 'when not eligible does not calculates discounts' do
    let(:rule) { PercentageRule.new(percentage_discount: 10, eligible_amount: 500) }

    it 'returns 0%' do
      expect(rule.calculate_discount(items)).to eq(60)
    end
  end
end
