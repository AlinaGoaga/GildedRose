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

  def update_quality
    @items.each do |item|
      # drop the quality by one for normal products (non tickets, brie, sulfuras)
      if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
        # quality can't be negative so we need to check
        if item.quality > 0
          update_normal(item) if item.name != 'Sulfuras, Hand of Ragnaros'
        end

      else
        # tickets and brie
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == 'Backstage passes to a TAFKAL80ETC concert'
            update_ticket(item)
          end
        end
      end

      if item.name != 'Sulfuras, Hand of Ragnaros'
        item.sell_in = item.sell_in - 1
      end

      # once sell_in becomes negative
      if item.sell_in < 0
        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            if item.quality > 0
              # quality degrades twice as fast
              update_normal(item) if item.name != 'Sulfuras, Hand of Ragnaros'
            end
          else
            # setting 0 for the tickets once the concert has passed
            update_ticket(item)
          end
        else
          # this is for aged brie
          item.quality = item.quality + 1 if item.quality < 50
        end
      end
    end
  end
end
