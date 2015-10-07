require 'test_helper'

class InputReaderTest < Minitest::Test
 
  
  def test_input_reader_set_dimension
    input_file = Dir.pwd + '/input_file/test_input.txt'
    StickyColour::InputReader.new(input_file)
  end
end