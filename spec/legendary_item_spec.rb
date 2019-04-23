describe GildedRose do
  describe '#update_quality for... ' do   
    describe 'Sulfuras' do
      it 'Sulfuras, being a legendary item, does not degrade in quality' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 10)]
        expect { GildedRose.new(items).update_quality }
          .to_not(change { items[0].quality })
      end

      it 'Sulfuras, being a legendary item, does not change sell_in' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 10)]
        expect { GildedRose.new(items).update_quality }
          .to_not(change { items[0].sell_in })
      end
    end
  end
end