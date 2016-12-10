require 'gosu'
require 'texplay'

require 'life'

module SymmetricalHappiness
  class GameOfLife < Gosu::Window
    include Life::Matrix

    CELL_WIDTH = 10
    CELL_HEIGHT = 10

    attr_reader :canvas, :world
    attr_reader :width, :height

    def initialize
      first_generation = Life::PatternLoader.pattern(:glider_gun)
      @world = Life::World.new(first_generation)

      @width = first_generation.first.size * CELL_WIDTH
      @height = first_generation.size * CELL_HEIGHT

      super width, height, update_interval: 200
      self.caption = self.class.name
    end

    def update
      world.next_generation!
    end

    def draw
      canvas = TexPlay.create_image(self, width, height, color: Gosu::Color::WHITE)
      walk(world.current) do |i, j, cell|
        x = j * CELL_WIDTH
        y = i * CELL_HEIGHT
        canvas.paint { rect(x, y, x + CELL_WIDTH, y + CELL_HEIGHT, color: :green) } if cell.is_alive?
      end
      canvas.draw(0, 0, 1)
    end

    def button_down(id)
      close if id == Gosu::KbEscape
    end

    def needs_cursor?
      true
    end
  end
end
