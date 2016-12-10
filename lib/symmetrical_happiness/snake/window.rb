require 'gosu'
require 'texplay'

module SymmetricalHappiness
  module Snake

    class Window < Gosu::Window
      def initialize
        super WIDTH, HEIGHT
        self.caption = CAPTION

        field = Field.new
        field_img = TexPlay.create_image(self, WIDTH, HEIGHT, color: Gosu::Color::WHITE)

        field.each do |cell|
          field_img.paint do
            rect cell.x, cell.y, cell.x + CELL_WIDTH, cell.y + CELL_HEIGHT, color: :green
          end
        end

        @img = field_img
      end

      def draw
        @img.draw(0, 0, 1)
      end

      def button_down(id)
        close if id == Gosu::KbEscape
      end

      def needs_cursor?
        true
      end
    end

  end
end
