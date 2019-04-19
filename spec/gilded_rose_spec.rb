require 'gilded_rose'
require 'item'
describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "decreases quality each day for generic items" do
      items = [Item.new("foo", 4, 4)]
      expect(items[0].quality).to eq(4)
      expect { GildedRose.new(items).update_quality() }.to change {items[0].quality }.by(-1)
    end

    it "decreases quality of generic items at 2x speed once sell-by has passed" do
      items = [Item.new(name="expired generic", sell_in=0, quality=20)]
      expect { GildedRose.new(items).update_quality() }.to change {items[0].quality}.by(-2)
    end

    it "will not decrease the quality of an item below 0" do
      items = [Item.new(name="expired generic with 0 quality", sell_in=0, quality=0)]
      expect { GildedRose.new(items).update_quality() }.to_not change {items[0].quality}
    end

  end

end
