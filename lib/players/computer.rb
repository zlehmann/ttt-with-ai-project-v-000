module Players
  class Computer < Player
    corners = [1,3,7,9]
    edges = [2,4,6,8]

    def move(board)
      if Game.board.taken?(5) == false
        return "5"
      else
        corners.each do |pos|
          if Game.board.taken?(pos.to_s) == false
            return "#{pos}"
          end
        end

        edges.each do |pos|
          if Game.board.taken?(pos.to_s) == false
            return "#{pos}"
          end
        end
      end

    end
  end
end
