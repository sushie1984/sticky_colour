require "sticky_colour/version"
require "sticky_colour/sticky_sheet"
require "sticky_colour/sticky_note"

module StickyColour  
  class StartApp
    attr_reader :sheet
    attr_reader :cyclic_inspect_call_value
    
    
    def self.main(input_file,cyclic_inspect_call_value=5)
      if File.exists?(input_file)
        @cyclic_inspect_call_value = cyclic_inspect_call_value
        read_input_file_per_line_and_do_operation(input_file) 
      end 
    end
    
    private
    
    def read_input_file_per_line_and_do_operation(input_file) 
      File.open(input_file, "r").each_line.with_index do |line,idx|
        case idx
        when 0
          set_sheet_dimension_by(line)
          else
          add_note_to_sheet_by(line)
        end 
      end
    end
    
    def set_sheet_dimension_by(line)
      dimensions = line.split(' ')
      x_maximum = dimensions[0].to_i
      y_maximum = dimensions[1].to_i
      @sheet = StickyColour::StickySheet.new(x_maximum,y_maximum,@cyclic_inspect_call_value)
    end
    
    def add_note_to_sheet_by(line)
      note = StickyColour::StickyNote.new(line)
      @sheet.set_colour_for_note(note)
    end
    
  end
  
end
