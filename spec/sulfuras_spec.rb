require 'sulfuras'

describe Sulfuras do
  describe '#update' do
    it 'does not change the quality and sell in value of the item' do
      sulfur = Sulfuras.new('Sulfuras', 9, 8)
      sulfur.update
      expect(sulfur.sell_in).to eq 9
      expect(sulfur.quality).to eq 8
    end
  end
end
