require 'item'

class Ticket < Item
  def update
    update_sell_in
    update_quality
  end

  def update_sell_in
    @sell_in -= 1
  end

  def update_quality
    @quality += 1 if @quality < 50
    @quality += 1 if @quality < 50 && @sell_in < 11
    @quality += 1 if @quality < 50 && @sell_in < 6
    @quality = 0 if @sell_in < 0
  end
end
