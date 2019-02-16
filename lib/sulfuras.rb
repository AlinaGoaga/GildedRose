require 'item'

class Sulfuras < Item
  def self.update(item)
    sell_in(item)
    quality(item)
  end

  def self.sell_in(item); end

  def self.quality(item); end
end
