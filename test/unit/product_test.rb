require 'test_helper'

class ProductTest < Test::Unit::TestCase
  should_not allow_value("sdfg").for(:image_url)
  should allow_value(5).for(:price)
  should allow_value("ruby quiz").for(:title)
end

