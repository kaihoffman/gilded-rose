require_relative 'item'
class GildedRose
  MAX_QUALITY = 50
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == "Sulfuras, Hand of Ragnaros"
        maintain_legendary_item(item)
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

  def maintain_legendary_item(item)
      # do_nothing
  end

  def aged_brie_update(item)
    change_quality(item, 1) unless item.quality == MAX_QUALITY
    lower_sell_in(item, 1)
  end

  def backstage_pass_update(item)
    if item.sell_in < 11 && item.sell_in > 6 && item.quality < MAX_QUALITY
      change_quality(item, 2)
    elsif item.sell_in < 6 && item.quality < MAX_QUALITY
      change_quality(item, 3)
    else change_quality(item, 1) unless item.quality == MAX_QUALITY
    end
    if item.sell_in <= 0
      change_quality(item, -(item.quality))
    end
    lower_sell_in(item, 1)
  end

  def regular_item_update(item)
    if item.sell_in < 1
      change_quality(item, -2) unless item.quality < 1
    else
      change_quality(item, -1)
    end
    lower_sell_in(item, 1)
  end

  def lower_sell_in(item, number_of_days)
    item.sell_in -= number_of_days
  end

  def change_quality(item, value)
    item.quality = item.quality + value
  end
end
