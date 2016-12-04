require 'gosu'

module SymmetricalHappiness
  class MyWindow < Gosu::Window
    def initialize
      super(640, 480)
      self.caption = 'Hello World!'
    end
  end
end
