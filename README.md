# StickyColour

The StickyColour gem is a Ruby solution for the pile of paper problem described in
https://github.com/fsufitch/dailyprogrammer/blob/master/ideas/pile_of_paper/suggest_paper.md

## Installation

1. git clone https://github.com/sushie1984/sticky_colour.git <br />
2. gem build stickey_colour.gemspec <br />
3. gem install ./sticky_colour-MAJOR.MINOR.BUILD.gem <br />

## Usage
**Prepare a input file containing the values:**
Have a look at https://github.com/fsufitch/dailyprogrammer/blob/master/ideas/pile_of_paper/paper1.in 
for an example.

Basically the very first line defines the horizontal and vertical size of the sheet/canvas that is going to be used
for the notes.<br /> **(e.g.: 10 10)**.<br />
The upcoming lines defining all sticky-notes that are going to be placed within the sheet/canvas in the manner of 
colour, horizontal start position, vertical start position, horizontal width, vertical width.<br /> **(e.g.: 1 0 0 4 4)**<br />
Keep in mind that the values of the sticky-notes have to be within the given horizontal and vertical size.

**Init irb with the new gem sticky_colour:** <br />
1. irb <br />
2. require "sticky_colour" <br />

**Call the StickyColour::StartApp with the given file containing the values:** <br />
 input_file = "path/to/your/input_file"<br />
 StickyColour::StartApp.main(input_file)<br />
 
**After StickyColour::StartApp.main is finished call last_run for results:**<br />
 last_run = StickyColour::StartApp.last_run<br />
 last_run['sheet'] --> Returns 2d Array containing the very last state of the sheet including all stacked sticky notes.<br />
 last_run['available_colours'] --> Returns a Hash containing the total amount of each sticky-notes colour attribute that is visible after the last state.<br />
## Development
The gem is mainly divided into 3 subclasses which can be found in **lib/sticky_colour/**, exchanging its 
values through old-style getter/setter:<br />
**StickySheet** is the class reprasenting the area/field for the StickyNote instances.<br />
**StickyNote** is the class reprasenting a sticky-note that is going to be put onto the StickySheet.<br />
**StickyOutput** is the class calculating (based on a specific strategy) the given amount of stacked StickyNotes colours stacked at the StickySheet.<br />

The core method for **StickySheet** is defined as **add**<br />
The core mehhod for **StickyOutput** is defined as **calculate_and_print_colour_output_for**<br />

Currently **StickyOutput** implements only the method **single_thread_line_calculator** which calculates the whole
amount iterative line per line.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sushie1984/sticky_colour.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

