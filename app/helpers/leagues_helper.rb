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

    def show_if_new_date array
        if array[-1].date.strftime("%A %d %B %Y") != ( array[-2] ? array[-2].date.strftime("%A %d %B %Y") : nil)
            '<div class="date-to-play text-left"><div class="date-wrapper"><strong>' + Russian::strftime(array[-1].date, "%A %d %b %Y").to_s + ', ' + array[-1].matchday.to_s + ' Тур' + '</strong></div></div>'
        end
    end

end