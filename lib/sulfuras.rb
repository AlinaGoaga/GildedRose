require 'item'

class Sulfuras < Item
  def update
    update_sell_in
    update_quality
  end

  def update_sell_in; end

  def update_quality; end
end
