module StickyColour
  class StickySheet
    attr_reader :x_maximum
    attr_reader :y_maximum
    attr_reader :x_y_field
    attr_reader :cyclic_inspect_method_call_value
    attr_reader :set_colour_counter
    
    def initialize(x_maximum=20,y_maximum=10,cyclic_inspect_method_call_value=5)
      @x_maximum = x_maximum
      @y_maximum = y_maximum
      @cyclic_inspect_method_call_value = cyclic_inspect_method_call_value
      puts "Instancing Sheet with @x_maximum #{@x_maximum}, @y_dimension: #{@y_maximum} @cyclic_inspect_method_call_value: #{@cyclic_inspect_method_call_value}"
      @x_y_field = Array.new(@y_maximum) {Array.new(@x_maximum,0)}
      @set_colour_counter = 0
    end
    
    def set_colour_for_note(note)
      x_end = note.x_start + note.x_height-1
      y_end = note.y_start + note.y_width-1
      @x_y_field[note.y_start..y_end].each do |line|
        line[note.x_start..x_end] = Array.new(note.x_height,note.colour)
      end
      @set_colour_counter = @set_colour_counter + 1
      inspect if @set_colour_counter%@cyclic_inspect_method_call_value == 0
    end
    
    def inspect
      @x_y_field.each do |line|
        puts StickySheet.inspect_line(line)
      end    
    end
    
    def self.inspect_line(line)
      line.join(' ')
    end
  
  end
  
end