require "sticky_colour/version"

module StickyColour
    
  class Sheet
    attr_reader :x_dimension
    attr_reader :y_dimension 
    attr_reader :canvas_matrix
    
    def initialize(input_file)
      return unless File.exists?(input_file)
      read_input_file_per_line_and_do_operation(input_file)
    end
    
    def set_paper_size(x_dimension=10,y_dimension=20)
      @x_dimension = x_dimension
      @y_dimension = y_dimension
      puts "@x_dimension: #{@x_dimension}, @y_dimension: #{@y_dimension}"
      @canvas_matrix = Array.new(@y_dimension) {Array.new(@x_dimension,0)}
      puts "@canvas_matrix: #{@canvas_matrix.to_s}"
    end
    
    def set_colour(colour,x_start,x_height,y_start,y_width)
      x_end = x_start+x_height
      y_end = y_start+y_width
      puts "x_end: #{x_end}, y_end: #{y_end}, @canvas_matrix: #{@canvas_matrix}"
      @canvas_matrix[y_start..y_end].each do |line|
        line[x_start..x_end] = Array.new(y_width,colour)
      end
    end
    
    
    private
    
    def read_input_file_per_line_and_do_operation(input_file) 
      File.open(input_file, "r").each_line.with_index do |line,idx|
        case idx
        when 0
          set_dimension(line)
          else
          extract_values_from(line)
        end 
      end
    end
    
    def set_dimension(line)
      dimensions = line.split(' ')
      set_paper_size(dimensions[0].to_i, dimensions[1].to_i)
    end
    
    def extract_values_from(line)
      values = line.split(' ')
      colour = values[0]
      x_start = values[1].to_i
      x_height = values[2].to_i
      y_start = values[3].to_i
      y_width = values[4].to_i
      puts "colour: #{colour},x_start: #{x_start}, x_height: #{x_height}, y_start: #{y_start}, y_width: #{y_width}"
      set_colour(colour,x_start,x_height,y_start,y_width)
    end
     
  end
  
end
