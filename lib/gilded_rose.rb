require_relative 'item'
class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
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

    end

    def aged_brie_update(item)
      if item.quality < 50
        item.quality += 1
      end
      lower_sell_in(item, 1)
    end

    def backstage_pass_update(item)
      if item.sell_in < 11 && item.sell_in > 6 && item.quality < 50
          item.quality = item.quality + 2
      elsif item.sell_in < 6 && item.quality < 50
          item.quality = item.quality + 3
      else item.quality = item.quality + 1 unless item.quality == 50
      end
      if item.sell_in == 0
        item.quality = 0
      end
      lower_sell_in(item, 1)
    end

    def regular_item_update(item)
      if item.sell_in < 1
        item.quality -= 2 unless item.quality < 1
      else
        item.quality -= 1
      end
      lower_sell_in(item, 1)
    end

    def lower_sell_in(item, number_of_days)
      item.sell_in -= number_of_days
    end

end
