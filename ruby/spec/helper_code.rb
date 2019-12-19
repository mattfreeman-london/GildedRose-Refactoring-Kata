# frozen_string_literal: true

require 'gilded_rose'

def three_days_pass(gilded_rose)
  3.times { gilded_rose.update_quality }
end

def ten_days_pass(gilded_rose)
  10.times { gilded_rose.update_quality }
end
