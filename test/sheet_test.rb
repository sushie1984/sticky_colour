require 'test_helper'

class SheetTest < Minitest::Test
  
  def test_default_sheet_instance
    sheet = StickyColour::StickySheet.new
    x_maximum = 20
    assert_equal x_maximum, sheet.x_maximum
  end
  
  def test_sheet_instance_with_given_value
    x_maximum = 100
    y_maximum = 50
    sheet = StickyColour::StickySheet.new(x_maximum,y_maximum)
    assert_equal y_maximum, sheet.y_maximum
  end
  
  def test_sheet_instance_with_given_value_and_matrix_set
    x_maximum = 75
    y_maximum = 25
    sheet = StickyColour::StickySheet.new(x_maximum,y_maximum)
    assert_equal x_maximum, sheet.x_y_field[0].length
  end
  
  def test_add_note_to_sheet_instance
    x_maximum = 20
    y_maximum = 10
    line_quadratic = "1 5 5 10 3"
    sheet = StickyColour::StickySheet.new(x_maximum,y_maximum,1)
    note = StickyColour::StickyNote.new(line_quadratic)
    sheet.set_colour_for_note(note)
    line_five = StickyColour::StickySheet.inspect_line(sheet.x_y_field[5])
    line_five_expectation = "0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0"
    assert_equal line_five_expectation,line_five
  end
  
  def test_add_two_overlapping_notes_to_sheet_instance
    x_maximum = 20
    y_maximum = 10
    line_quadratic = "1 5 5 10 3"
    sheet = StickyColour::StickySheet.new(x_maximum,y_maximum,1)
    note = StickyColour::StickyNote.new(line_quadratic)
    sheet.set_colour_for_note(note)
    line_quadratic = "2 0 0 7 7 "
    note = StickyColour::StickyNote.new(line_quadratic)
    sheet.set_colour_for_note(note)
    line_five = StickyColour::StickySheet.inspect_line(sheet.x_y_field[5])
    line_five_expectation = "2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 0 0 0 0 0"
    assert_equal line_five_expectation,line_five
  end
  
end