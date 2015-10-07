require 'test_helper'

class StickyColourTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::StickyColour::VERSION
  end
  
  def test_static_sheet_with_default_input
    x_dim = 10
    y_dim = 20
    StickyColour::Sheet.set_paper_size(x_dim,y_dim)
    assert_equal x_dim,StickyColour::Sheet.x_dimension
  end
  

end
