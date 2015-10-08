require 'test_helper'

class StickyColourTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::StickyColour::VERSION
  end
  
  def test_start_app_with_test_input_txt
    input_file = Dir.pwd + "/test/input_file/test_input.txt"
    StickyColour::StartApp.main(input_file)
    available_colours = StickyColour::StartApp.last_run['available_colours']
    expected_available_colours = {0=>125, 1=>26,2=>49}
    assert_equal expected_available_colours, available_colours
  end
  
  def test_start_app_with_large_input_txt
    input_file = Dir.pwd + "/test/input_file/test_large_input.txt"
    StickyColour::StartApp.main(input_file,-1)
    available_colours = StickyColour::StartApp.last_run['available_colours']
    expected_available_colours =  {0=>2721, 6=>303, 7=>1213, 8=>766, 5=>752, 9=>496, 4=>335, 3=>2212, 1=>587, 10=>349, 2=>266}
    assert_equal expected_available_colours, available_colours
  end
  
end