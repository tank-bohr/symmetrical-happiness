require 'symmetrical_happiness'

module SymmetricalHappiness
  module Snake
    WIDTH = 640
    HEIGHT = 480
    CAPTION = 'Snake'.freeze

    CELL_WIDTH = 10
    CELL_HEIGHT = 10

    autoload :Window, 'symmetrical_happiness/snake/window'
    autoload :Field, 'symmetrical_happiness/snake/field'
    autoload :Cell, 'symmetrical_happiness/snake/cell'
  end
end
