module Players
  class Computer < Player
    corners = [0,2,6,8]
    edges = [1,3,5,77]

    def move(board)
      if board.taken?(5) == false
        return "5"
      else
        corners.each do |pos|
          if board[pos] == " "
            output = pos + 1
            return "#{output.to_s}"
          end
        end

        edges.each do |pos|
          if board[pos] == " "
            output = pos + 1
            return "#{output.to_s}"
          end
        end
      end

    end
  end
end
