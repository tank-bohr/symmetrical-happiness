require 'gosu'

require 'symmetrical_happiness'
require 'symmetrical_happiness/gosu_tutorial/z_order'
require 'symmetrical_happiness/gosu_tutorial/player'
require 'symmetrical_happiness/gosu_tutorial/star'

module SymmetricalHappiness::GosuTutorial
  class GameWindow < Gosu::Window
    def initialize
      super 640, 480
      self.caption = "Gosu Tutorial Game"

      @background_image = Gosu::Image.new("media/space.png", tileable: true)
      @player = Player.new
      @player.warp(320, 240)

      @star_anim = Gosu::Image::load_tiles("media/star.png", 25, 25)
      @stars = Array.new

      @font = Gosu::Font.new(20)
    end

    def update
      if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
        @player.turn_left
      end
      if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
        @player.turn_right
      end
      if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0 then
        @player.accelerate
      end

      @player.move
      @player.collect_stars(@stars)

      if rand(100) < 4 && @stars.size < 25
        @stars << Star.new(@star_anim)
      end
    end

    def draw
      @player.draw
      @background_image.draw(0, 0, ZOrder::Background)
      @stars.each(&:draw)
      @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
    end

    def button_down(id)
      if id == Gosu::KbEscape
        close
      end
    end

  end
end
