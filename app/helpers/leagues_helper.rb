module LeaguesHelper

    def change_league_table_row_color league, position

        if league == 'apl' || league == 'seria-a' || league == 'laliga'
            if position == 1
                '#e4e4e4'
            elsif position < 5 || position > 17
                '#eeeeee'
            end
        elsif league == 'bundesliga'
            if position == 1
                '#e4e4e4'
            elsif position < 5 || position > 15
                '#eeeeee'
            end
        elsif league == 'chempions-league'   
            if position < 3
                '#e4e4e4'
            elsif position == 3
                '#eeeeee'
            end
        end
        
    end

end