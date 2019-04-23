require 'gilded_rose'
require 'item'
describe GildedRose do
  describe '#update_quality for... ' do
    describe 'Aged brie' do
      it 'Aged brie quality actually increases by 1 when updated' do
        items = [Item.new('Aged Brie', 10, 10)]
        expect { GildedRose.new(items).update_quality }
          .to(change { items[0].quality }.by(1))
      end
      it 'maxes out quality at 50' do
        items = [Item.new('Aged Brie', 10, 50)]
        expect { GildedRose.new(items).update_quality }
          .to_not(change { items[0].quality })
      end
    end
  end
end