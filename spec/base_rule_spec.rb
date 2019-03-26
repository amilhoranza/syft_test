require 'base_rule'
require 'item'

describe BaseRule.new do

  context 'calculates total items price' do
    let(:items) do
      [
        Item.new('001', 'Item 1', 10),
        Item.new('002', 'Item 2', 20),
        Item.new('001', 'Item 1', 10)
      ]
    end

    it 'returns with discount' do
      expect(subject.total_items(items)).to eq(40)
    end
  end
end
