class Normal < Item
  def self.update_normal(item)
    item.sell_in -= 1
    item.quality -= 1 if item.quality > 0
    item.quality -= 1 if item.quality > 0 && item.sell_in < 0
  end
end
