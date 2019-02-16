class Normal < Item
  def self.update(item)
    sell_in(item)
    quality(item)
  end

  def self.sell_in(item)
    item.sell_in -= 1
  end

  def self.quality(item)
    item.quality -= 1 if item.quality > 0
    item.quality -= 1 if item.quality > 0 && item.sell_in < 0
  end
end
