# frozen_string_literal: true

# class update quality of all items in the Gilded Rose shop
class GildedRose

  def initialize(items)
    @items = items
  end

  def reduce_sell_in()
    @items.each do |item|
      if item.name != 'Sulfuras, Hand of Ragnaros'
        item.sell_in = item.sell_in - 1
      end
    end
  end

  def adjust_regular_stock_quality()
    @items.each do |item|
      if item.quality > 0
        if item.name != 'Sulfuras, Hand of Ragnaros'
          item.quality = item.quality - 1
        end
      end
    end
  end


  def adjust_concert_tickets()
    @items.each do |item|
      if item.quality < 50
        item.quality = item.quality + 1
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          if item.sell_in < 11
            
            if item.quality < 50
              item.quality = item.quality + 1
            end
          
          end
          
          if item.sell_in < 6
            if item.quality < 50
              item.quality = item.quality + 1
            end
          end

        end
      end
    end
  end

  def adjust_based_on_sell_in()
    @items.each do |item|
      if item.sell_in < 0
        if item.name != 'Aged Brie'
          
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            
            if item.quality > 0
              if item.name != 'Sulfuras, Hand of Ragnaros'
                item.quality = item.quality - 1
              end
            end
          
          else
            item.quality = item.quality - item.quality
          end
  
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      
      end
    end
    
  end

  def update_quality()
    reduce_sell_in()
    @items.each do |item|
      
      if item.name != 'Aged Brie' and item.name != 'Backstage passes to a TAFKAL80ETC concert'
        adjust_regular_stock_quality()
      else
        adjust_concert_tickets()
      end
      
      adjust_based_on_sell_in()  

    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
