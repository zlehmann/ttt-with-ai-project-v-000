module Players
  class Computer < Player
    corners = [1,3,7,9]
    edges = [2,4,6,8]

    def move(board)
      if board.taken?(5) == false
        return "5"
      else
        corners.each do |pos|
          if board.taken?(pos) == false
            return "#{pos.to_s}"
          end
        end

        edges.each do |pos|
          if board.taken?[pos] == false
            return "#{pos.to_s}"
          end
        end
      end

    end
  end
end
