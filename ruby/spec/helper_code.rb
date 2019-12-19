require 'gilded_rose'
require 'gilded_rose_spec'

def three_days_pass
  GildedRose.new(items).update_quality()
  GildedRose.new(items).update_quality()
  GildedRose.new(items).update_quality()
end
