class Board

    attr_reader :my_board, :results

    def initialize()
        @my_board={
            1=>"X",
            2=>"X",
            3=>"X",
            4=>"X",
            5=>"X",
            6=>"X",
            7=>"X",
            8=>"X",
            9=>"X",
        }
        @results=false
    end

    def input_position(value,player_id)
       if self.my_board[value] =="X"
        self.my_board[value]=player_id
        @results = results_check(value,player_id)
       else
        return "position filled, choose another"
       end

    end

    def results_check(position,p_id)

        vertical = vertical_check(position,p_id)
        horiz = horizontal_check(position,p_id)
        diag = diag_check(position,p_id)

        # check if any check for win is true
        return [vertical,horiz,diag].any?
                
    end

    def vertical_check(position,p_id)

        my_array = []
       
        case position
        when 1..3
            my_array <<  my_board[position]
            my_array <<  my_board[position+3]
            my_array <<  my_board[position+6]
        when 4..6
            my_array <<  my_board[position-3]
            my_array <<  my_board[position]
            my_array <<  my_board[position+3]
        else
            my_array <<  my_board[position-6]
            my_array <<  my_board[position-3]
            my_array <<  my_board[position]
        end

        return my_array.all?{|i| i==p_id}

    end

    def horizontal_check(position,p_id)

        my_array = []

        if position % 3 == 0
            my_array << my_board[position-2]
            my_array << my_board[position -1]
            my_array << my_board[position]
        elsif position % 3 == 1
            my_array << my_board[position]
            my_array << my_board[position+1]
            my_array << my_board[position+2]
        else
            my_array << my_board[position-1]
            my_array << my_board[position]
            my_array << my_board[position+1]
        end

         return my_array.all?{|i| i==p_id}

    end

    def diag_check(position,p_id)

        if position % 2 == 0
            return false
        end

        case position
        when 1,5,9
            my_array = [my_board[1],my_board[5],my_board[9]]
        when 3,5,7
            my_array = [my_board[3],my_board[5],my_board[7]]
        end

        return my_array.all?{|i| i==p_id}

    end
    
end