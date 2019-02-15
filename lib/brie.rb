class Brie < Item
  def self.update_brie(item)
    item.sell_in -= 1
    item.quality += 1 if item.quality < 50
  end
end
