module StickyColour
  class StickyNote
    attr_reader :x_start
    attr_reader :y_start
    attr_reader :x_height
    attr_reader :y_width
    attr_reader :colour
    
    def initialize(line)
      values = line.split(' ')
      return if values.length != 5
      @colour = values[0].to_i
      @x_start = values[1].to_i
      @y_start = values[2].to_i
      @x_height = values[3].to_i
      @y_width = values[4].to_i
      puts "Instancing a Note with values --> colour: #{colour},x_start: #{x_start}, x_height: #{x_height}, y_start: #{y_start}, y_width: #{y_width}"
    end
    
  end
end