class Ticket < Item
  def self.update_ticket(item)
    item.quality = 0 if item.sell_in < 0
    item.sell_in -= 1
    item.quality += 1 if item.quality < 50
    item.quality += 1 if item.quality < 50 && item.sell_in < 11
    item.quality += 1 if item.quality < 50 && item.sell_in < 6
  end
end
