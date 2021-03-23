require 'base_rule'
require 'item'

describe BaseRule.new do
  context '#total_items' do
    let(:items) do
      [
        Item.new('001', 'Item 1', 10),
        Item.new('002', 'Item 2', 20),
        Item.new('001', 'Item 1', 10)
      ]
    end

    it 'returns total with discount' do
      expect(subject.total_items(items)).to eq(40)
    end
  end

  context '#calculate_discount' do
    let(:items) do
      [
        Item.new('001', 'Item 1', 10),
        Item.new('002', 'Item 2', 20),
        Item.new('001', 'Item 1', 10)
      ]
    end

    it 'raise an error' do
      expect{ subject.calculate_discount(items) }.to raise_error NotImplementedError
    end
  end
end
