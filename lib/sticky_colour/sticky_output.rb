module StickyColour
  class StickyOutput
    
    def self.calculate_and_print_colour_output_for(sheet,strategy=1)
      available_colours = nil
      case strategy
      when 1
        available_colours = StickyOutput.single_thread_line_calculator(sheet)
      else
        puts "Strategy not available. Pls use default one"
      end
      available_colours
    end
    
    def self.single_thread_line_calculator(sheet)
      available_colours = sheet.available_colours
      sheet.x_y_field.each do |line|
        available_colours.each do |colour,amount|
          available_colours[colour] = amount + line.count(colour)
        end  
      end
      StickyOutput.print_hash_output_for(available_colours)
      available_colours
    end
    
    def self.print_hash_output_for(available_colours)
      available_colours.each do |k,v|
        puts "#{k} #{v}"
      end
    end
   
  end
end