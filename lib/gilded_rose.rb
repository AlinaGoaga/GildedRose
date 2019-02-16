require 'sulfuras'
require 'brie'
require 'ticket'
require 'normal'
require 'conjured'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each(&:update)
  end
end
