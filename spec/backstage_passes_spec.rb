require 'gilded_rose'
require 'item'
describe GildedRose do
  describe '#update_quality for... ' do
    describe 'Backstage passes' do
      it 'increase in value by 1 per day above 10 days sell_in' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 20, 10)]
      expect { GildedRose.new(items).update_quality }
          .to change { items[0].quality }.by(1)
      end
      it 'increase in value by 2 per day at or below 10 days sell_in' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)]
      expect { GildedRose.new(items).update_quality }
          .to change { items[0].quality }.by(2)
      end
      it 'increase in value by 3 per day at or below 5 days sell_in' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10)]
      expect { GildedRose.new(items).update_quality }
          .to change { items[0].quality }.by(3)
      end
      it 'drops value to 0 if date to sell has passed' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 50)]
      expect { GildedRose.new(items).update_quality }
          .to change { items[0].quality }.by(-50)
      end
      it 'keeps value at 0 if date to sell is negative' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', -1, 50)]
      expect { GildedRose.new(items).update_quality }
          .to change { items[0].quality }.to eq(0)
      end
      it 'maxes out quality at 50' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 50)]
      expect { GildedRose.new(items).update_quality }
          .to_not(change { items[0].quality })
      end
    end
  end
end