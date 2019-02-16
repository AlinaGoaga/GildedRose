require 'item'

class Brie < Item
  def update
    update_sell_in
    update_quality
  end

  def update_sell_in
    @sell_in -= 1
  end

  def update_quality
    @quality += 1 if @quality < 50
  end
end
