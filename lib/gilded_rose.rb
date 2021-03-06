require_relative 'item'
class GildedRose
  MAX_QUALITY = 50
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == "Sulfuras, Hand of Ragnaros"
        next
      elsif item.name.include?("Conjured") || item.name.include?("conjured")
        conjured_item_update(item)
      elsif item.name == "Aged Brie"
        aged_brie_update(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        backstage_pass_update(item)
      else
        regular_item_update(item)
      end
    end
  end

  private

  def aged_brie_update(item)
    change_quality(item, 1) unless item.quality == MAX_QUALITY
    lower_sell_in(item, 1)
  end

  def backstage_pass_update(item)
    if item.sell_in <= 0
      change_quality(item, -item.quality)
    elsif item.sell_in < 6
      change_quality(item, 3)
    elsif item.sell_in < 11
      change_quality(item, 2)
    else
      change_quality(item, 1)
    end
  end

  def regular_item_update(item)
    if item.sell_in < 1
      change_quality(item, -2) unless item.quality < 1
    else
      change_quality(item, -1)
    end
    lower_sell_in(item, 1)
  end

  def conjured_item_update(item)
    change_quality(item, -2)
    lower_sell_in(item, 1)
  end

  def lower_sell_in(item, number_of_days)
    item.sell_in -= number_of_days
  end

  def change_quality(item, value)
    item.quality = item.quality + value
    if item.quality > MAX_QUALITY
      item.quality = MAX_QUALITY
    end
    item.quality = 0 if item.quality < 0
  end
end
