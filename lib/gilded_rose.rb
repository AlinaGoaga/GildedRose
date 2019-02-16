require_relative 'item'
require_relative 'sulfuras'
require_relative 'brie'
require_relative 'ticket'
require_relative 'normal'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      Brie.update(item) if item.name == 'Aged Brie'
      Ticket.update(item) if item.name == 'Backstage passes to a TAFKAL80ETC concert'
      Normal.update(item) if item.name == 'Normal'
      Sulfuras.update(item) if item.name == 'Sulfuras, Hand of Ragnaros'
    end
  end
end
