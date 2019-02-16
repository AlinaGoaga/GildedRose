require 'normal'

describe Normal do
  describe '#update' do
    context 'before sell_in date becomes negative' do
      it 'updates the item' do
        normal = Normal.new('Normal', 5, 5)
        normal.update
        expect(normal.sell_in).to eq 4
        expect(normal.quality).to eq 4
      end
    end

    context 'once sell_in date is negative' do
      it 'updates the item by lowering the quality twice as fast' do
        normal = Normal.new('Normal', 0, 5)
        normal.update
        expect(normal.sell_in).to eq(-1)
        expect(normal.quality).to eq 3
      end
    end
  end

  describe '#quality' do
    it 'is never becomes negative' do
      normal = Normal.new('Normal', 4, 0)
      normal.update
      expect(normal.sell_in).to eq 3
      expect(normal.quality).to eq 0
    end
  end
end
