require 'item'
require 'sulfuras'
require 'brie'
require 'ticket'
require 'normal'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_normal(item)
    item.quality = item.quality - 1
  end

  def update_ticket(item)
    if item.sell_in < 11
      item.quality = item.quality + 1 if item.quality < 50
    end
    if item.sell_in < 6
      item.quality = item.quality + 1 if item.quality < 50
    end
    item.quality = 0 if item.sell_in < 0
  end

  def update_brie(item)
    item.quality = item.quality + 1 if item.quality < 50
  end

  def update_quality
    @items.each do |item|
      if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
        update_normal(item) if item.name == 'Normal' && item.quality > 0
      else
        if item.quality < 50
          item.quality = item.quality + 1
          update_ticket(item) if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        end
      end

      if item.name != 'Sulfuras, Hand of Ragnaros'
        item.sell_in = item.sell_in - 1
      end

      # once the above adjustment happens, check if the sell in is negative
      next unless item.sell_in < 0

      update_normal(item) if item.name != 'Sulfuras, Hand of Ragnaros' && item.quality > 0
      update_ticket(item) if item.name == 'Backstage passes to a TAFKAL80ETC concert'
      update_brie(item) if item.name == 'Aged Brie'
    end
  end
end
