require 'brie'

describe Brie do
  describe '#update' do
    it 'updates the item' do
      brie = Brie.new('Aged Brie', 9, 8)
      brie.update
      expect(brie.sell_in).to eq 8
      expect(brie.quality).to eq 9
    end
  end

  describe '#quality' do
    it 'can never be more than 50' do
      brie = Brie.new('Aged Brie', 10, 50)
      brie.update
      expect(brie.sell_in).to eq 9
      expect(brie.quality).to eq 50
    end
  end
end
