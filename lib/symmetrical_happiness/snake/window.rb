require 'gosu'
require 'texplay'

module SymmetricalHappiness
  module Snake

    class Window < Gosu::Window
      def initialize
        super WIDTH, HIGHT
        self.caption = CAPTION

        @img = TexPlay.create_image(self, WIDTH, HIGHT, color: Gosu::Color::WHITE).tap do |img|
          img.rect 0, 0, WIDTH - 1, HIGHT - 1
          img.bezier points, color: :red
          img.paint do
            circle 20, 20, 10, color: :red
            rect 40, 40, 50, 50, color: :green
            pixel 60, 60, color: :blue
          end
        end
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

      private

      def points
        (0..WIDTH + 100).step(40).map do |x|
          TexPlay::TPPoint.new.tap do |point|
            point.x = x
            point.y = HIGHT * rand
          end
        end.take(17)
      end
    end

  end
end
