require 'gilded_rose'
require 'item'
describe GildedRose do
  describe '#update_quality for... ' do
    describe 'Conjured items' do
      it 'degrades quality of conjured items 2x speed but sell_in by 1' do
        items = [Item.new('conjured mana cake', 10, 10)]
        expect { GildedRose.new(items).update_quality }
          .to change { items[0].quality }.by(-2)
      end
    end
  end
end
