require 'test_helper'

class NoteTest < Minitest::Test
  
  def test_note_instance_with_values
    line = "1 1 1 3 3"
    note = StickyColour::StickyNote.new(line)
    x_heigth = 3
    assert_equal x_heigth, note.x_height
  end
  
  def test_note_instance_with_wrong_values
    line = "1 1 1 3"
    note = StickyColour::StickyNote.new(line)
    assert_nil note.colour
  end
  
end