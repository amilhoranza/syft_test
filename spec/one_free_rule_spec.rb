require 'one_free_rule'
require 'item'

describe 'OneFreeRule' do
  let(:rule) do
    OneFreeRule.new(
      product_code: '003', quantity_eligible: 3, amount_discounted: 19.95
    )
  end

  context 'when not eligible does not gives one free' do
    let(:items) do
      [
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95)
      ]
    end

    it 'returns without discount' do
      expect(rule.calculate_discount(items)).to eq(39.9)
    end
  end

  context 'when is eligible gives one free' do
    let(:items) do
      [
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95)
      ]
    end

    it 'returns one free discount' do
      expect(rule.calculate_discount(items).round(2)).to eq(39.9)
    end
  end

  context 'when is eligible with six items gives two free' do
    let(:items) do
      [
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95)
      ]
    end

    it 'returns two free discount' do
      expect(rule.calculate_discount(items).round(2)).to eq(79.8)
    end
  end

  context 'when is eligible with 5 gives 1 free plus discount coupon value' do
    let(:items) do
      [
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('004', 'Discount cupom', -5.00)
      ]
    end

    it 'returns 1 free plus discount coupon value' do
      expect(rule.calculate_discount(items).round(2)).to eq(74.8)
    end
  end

  context 'when is eligible with 7 gives 2 free plus discount coupon value' do
    let(:items) do
      [
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('003', 'Kids T-shirt', 19.95),
        Item.new('004', 'Discount cupom', -5.00)
      ]
    end

    it 'returns 2 free plus discount coupon value' do
      expect(rule.calculate_discount(items).round(2)).to eq(94.75)
    end
  end
end
