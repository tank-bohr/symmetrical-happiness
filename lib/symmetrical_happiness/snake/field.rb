module SymmetricalHappiness
  module Snake

    class Field

      attr_reader :rows_cnt, :columns_cnt, :data

      def initialize
        @rows_cnt = HEIGHT / CELL_HEIGHT
        @columns_cnt = WIDTH / CELL_WIDTH

        @data = rows_cnt.times.map do |i|
          columns_cnt.times.map do |j|
            Cell.new(x: j * CELL_WIDTH, y: i * CELL_HEIGHT)
          end
        end
      end

      def each
        data.each do |row|
          row.each do |cell|
            yield cell
          end
        end
      end
    end

  end
end
