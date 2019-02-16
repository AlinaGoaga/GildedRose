require 'conjured'

describe Conjured do
  describe '#update' do
    context 'before sell_in date becomes negative' do
      it 'updates the item' do
        conjured = Conjured.new('Conjured', 9, 8)
        conjured.update
        expect(conjured.sell_in).to eq 8
        expect(conjured.quality).to eq 6
      end
    end

    context 'once sell_in date is negative' do
      it 'updates the item by lowering the quality twice as fast' do
        conjured = Conjured.new('Conjured', -1, 8)
        conjured.update
        expect(conjured.sell_in).to eq(-2)
        expect(conjured.quality).to eq 4
      end
    end
  end

  describe '#quality' do
    it 'is never becomes negative' do
      conjured = Conjured.new('Conjured', 5, 0)
      conjured.update
      expect(conjured.sell_in).to eq 4
      expect(conjured.quality).to eq 0
    end
  end
end
