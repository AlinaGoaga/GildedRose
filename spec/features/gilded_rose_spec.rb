require 'gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    it 'updates the quality of different items' do
      normal = Normal.new('Normal', 5, 5)
      sulfur = Sulfuras.new('Sulfuras, Hand of Ragnaros', 10, 5)
      brie = Brie.new('Aged Brie', 9, 8)
      ticket = Ticket.new('Backstage passes to a TAFKAL80ETC concert', 6, 8)
      conjured = Conjured.new('Conjured', 9, 8)

      rose = GildedRose.new([normal, sulfur, brie, conjured, ticket])
      updated = rose.update_quality

      expect(updated[0].sell_in).to eq 4
      expect(updated[0].quality).to eq 4

      expect(updated[1].sell_in).to eq 10
      expect(updated[1].quality).to eq 5

      expect(updated[2].sell_in).to eq 8
      expect(updated[2].quality).to eq 9

      expect(updated[3].sell_in).to eq 8
      expect(updated[3].quality).to eq 6

      expect(updated[4].sell_in).to eq 5
      expect(updated[4].quality).to eq 11
    end
  end
end
