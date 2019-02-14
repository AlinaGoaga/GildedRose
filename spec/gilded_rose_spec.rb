require 'gilded_rose'

describe GildedRose do
  # name, days to sell, quality

  describe '#update_quality' do
    # The quality of a normal item drops by one at the end of each day.
    it 'updates the quality of normal items' do
      normal = Item.new('Normal', 5, 5)
      rose = GildedRose.new([normal])
      updated = rose.update_quality
      expect(updated[0].sell_in).to eq 4
      expect(updated[0].quality).to eq 4
    end

    # “Sulfuras”, being a legendary item, never has to be sold or decreases in quality.
    it 'updates the quality of sulfur items' do
      sulfur = Item.new('Sulfuras, Hand of Ragnaros', 10, 5)
      rose = GildedRose.new([sulfur])
      updated = rose.update_quality
      expect(updated[0].sell_in).to eq 10
      expect(updated[0].quality).to eq 5
    end

    # “Aged Brie” actually increases in Quality the older it gets
    it 'updates the quality of aged brie' do
      brie = Item.new('Aged Brie', 9, 8)
      rose = GildedRose.new([brie])
      updated = rose.update_quality
      expect(updated[0].sell_in).to eq 8
      expect(updated[0].quality).to eq 9
    end

    # “Backstage passes” increases in quality as it’s sell in value approaches;
    # quality increases by 2 when there are 10 days or less
    # and by 3 when there are 5 days or less but quality drops to 0 after the concert.
    it 'updates the quality of tickets' do
      ticket1 = Item.new('Backstage passes to a TAFKAL80ETC concert', 6, 8)
      ticket2 = Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 8)
      ticket3 = Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 8)
      rose = GildedRose.new([ticket1, ticket2, ticket3])
      updated = rose.update_quality
      expect(updated[0].sell_in).to eq 5
      expect(updated[0].quality).to eq 10
      expect(updated[1].sell_in).to eq 3
      expect(updated[1].quality).to eq 11
      expect(updated[2].sell_in).to eq -1
      expect(updated[2].quality).to eq 0
    end

    it 'once the sell by date has passed, quality degrades twice as fast' do
      normal = Item.new('Normal', 0, 5)
      rose = GildedRose.new([normal])
      updated = rose.update_quality
      expect(updated[0].sell_in).to eq -1
      expect(updated[0].quality).to eq 3
    end

    it 'the quality of an item is never negative' do
      normal = Item.new('Normal', 3, 0)
      rose = GildedRose.new([normal])
      updated = rose.update_quality
      expect(updated[0].sell_in).to eq 2
      expect(updated[0].quality).to eq 0
    end

    it 'the quality of an item is never higher than 50' do
      brie = Item.new('Aged Brie', 10, 50)
      rose = GildedRose.new([brie])
      updated = rose.update_quality
      expect(updated[0].sell_in).to eq 9
      expect(updated[0].quality).to eq 50
    end
  end
end
