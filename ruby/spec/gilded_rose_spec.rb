# frozen_string_literal: true

require 'gilded_rose'
require_relative 'helper_code'
describe GildedRose do
  describe "#update_quality" do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end

    it 'lowers sell_in and quality by 1 each day' do
      items = [Item.new('+5 Dexterity Vest', 10, 10)]
      subject = GildedRose.new(items)
      three_days_pass(subject)
      expect(items[0].sell_in).to eq(7)
      expect(items[0].quality).to eq(7)
    end

    it 'degrades quality twice as fast after the sell by date' do
      items = [Item.new('+5 Dexterity Vest', 1, 10)]
      subject = GildedRose.new(items)
      three_days_pass(subject)
      expect(items[0].quality).to eq(5)
    end

    it 'does not decrease quality below 0' do
      items = [Item.new('Elixir of the Mongoose', 1, 1)]
      subject = GildedRose.new(items)
      three_days_pass(subject)
      expect(items[0].quality).to eq(0)
    end

    it 'does not increase quality beyond 50' do
      items = [Item.new('Aged Brie', 10, 49)]
      subject = GildedRose.new(items)
      three_days_pass(subject)
      expect(items[0].quality).to eq(50)
    end

    describe 'Aged Brie' do
      it 'increases the quality of Aged Brie over time' do
        items = [Item.new('Aged Brie', 2, 0)]
        subject = GildedRose.new(items)
        three_days_pass(subject)
        expect(items[0].quality).to eq(4)
      end
    end

    describe 'Sulfuras, Hand of Ragnaros' do
      it 'does not decrease the quality of Sulfuras' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 2, 80)]
        subject = GildedRose.new(items)
        three_days_pass(subject)
        expect(items[0].quality).to eq(80)
      end
    end

    describe 'Backstage passes' do
      it 'Quality increases by 2 when there are less than 10 days to the concert' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 20)]
        subject = GildedRose.new(items)
        three_days_pass(subject)
        expect(items[0].quality).to eq(26)
      end

      it 'Quality increases by 3 when there are less than 5 days to the concert' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 20)]
        subject = GildedRose.new(items)
        three_days_pass(subject)
        expect(items[0].quality).to eq(29)
      end

      it 'Quality drops to zero after the concert' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 2, 20)]
        subject = GildedRose.new(items)
        three_days_pass(subject)
        expect(items[0].quality).to eq(0)
      end

      it 'Quality cannot increase over 50' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49)]
        subject = GildedRose.new(items)
        three_days_pass(subject)
        expect(items[0].quality).to eq(50)
      end
    end
  end
end
