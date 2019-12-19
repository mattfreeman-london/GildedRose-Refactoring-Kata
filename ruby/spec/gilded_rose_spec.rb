require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it 'increases the quality of Aged Brie over time' do
      items = [Item.new("Aged Brie", 2, 0)]
      GildedRose.new(items).update_quality()
      GildedRose.new(items).update_quality()
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(4)
    end

    it 'does not decrease the quality of Sulfuras' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
      GildedRose.new(items).update_quality()
      GildedRose.new(items).update_quality()
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(80)
    end

    it 'does not decrease quality below 0' do
      items = [Item.new("Elixir of the Mongoose", 1, 1)]
      GildedRose.new(items).update_quality()
      GildedRose.new(items).update_quality()
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end
  end

end
