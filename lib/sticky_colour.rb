require "sticky_colour/version"
require "sticky_colour/sticky_sheet"
require "sticky_colour/sticky_note"
require "sticky_colour/sticky_output"

module StickyColour  
  class StartApp
    
    @@last_run = Hash.new
    
    def self.main(input_file,cyclic_inspect_call_value=5)
      if File.exists?(input_file)
        @cyclic_inspect_call_value = cyclic_inspect_call_value
        StartApp.read_input_file_per_line_and_do_operation(input_file)
        available_colours = StickyOutput.calculate_and_print_colour_output_for(@sheet)
        @@last_run['available_colours'] = available_colours 
      end 
    end
    
    def self.last_run
      @@last_run unless @@last_run.empty?
    end
    private
    
    def self.read_input_file_per_line_and_do_operation(input_file) 
      File.open(input_file, "r").each_line.with_index do |line,idx|
        case idx
        when 0
          StartApp.set_sheet_dimension_by(line)
          else
          StartApp.add_note_to_sheet_by(line)
        end 
      end
    end
    
    def self.set_sheet_dimension_by(line)
      dimensions = line.split(' ')
      x_maximum = dimensions[0].to_i
      y_maximum = dimensions[1].to_i
      @sheet = StickyColour::StickySheet.new(x_maximum,y_maximum,@cyclic_inspect_call_value)
      @@last_run['sheet'] = @sheet
    end
    
    def self.add_note_to_sheet_by(line)
      note = StickyColour::StickyNote.new(line)
      @sheet.add(note)
    end
    
  end
  
end
