require 'item'

class Conjured < Item
  def update
    update_sell_in
    update_quality
  end

  def update_sell_in
    @sell_in -= 1
  end

  def update_quality
    @quality -= 2 if @quality > 0
    @quality -= 2 if @quality > 0 && @sell_in < 0
  end
end
