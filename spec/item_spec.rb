require 'item'

describe 'Item' do
  context 'Check Item Attributes' do
    let(:result) { Item.new('001', 'Item 1', 10) }

    it 'returns item code' do
      expect(result.code).to eq('001')
    end

    it 'returns item name' do
      expect(result.name).to eq('Item 1')
    end

    it 'returns item price' do
      expect(result.price).to eq(10)
    end

    it 'sets a new price' do
      new_price = result.price = 11
      expect(new_price).to eq(11)
    end
  end
end
