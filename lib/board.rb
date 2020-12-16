class Board
    attr_accessor :cells

    def initialize
        
        @cells =[" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    
    def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display 
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input) 
       input = input.to_i
       cells[input -1]
    end

    def full?
        @cells.all? {|i| i == "X" || i == "O"}
    end

    def turn_count
       @cells.count {|i| i == "X" || i == "O"}
    end

    def taken?(data) 
    position(data) == "X" || position(data) == "O"
    end

    def valid_move?(data)
        data = data.to_i
        !(taken?(data)) && data.between?(1, 9)
    end
   
      def update(data, plr)
        data = data.to_i
        cells[data -1] = plr.token 
      end
end