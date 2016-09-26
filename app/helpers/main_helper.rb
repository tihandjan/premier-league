module MainHelper
    
    def select_team
        [
        "Manchester City FC", 
        "Chelsea FC", 
        "Manchester United FC", 
        "Everton FC", 
        "Tottenham Hotspur FC", 
        "Arsenal FC", 
        "Leicester City FC", 
        "Liverpool FC", 
        "West Ham United FC", 
        "Swansea City FC"
        ].map{ |team| [team] }
    end
    
    def change_blank current_user
        current_user.team.blank? ? "Выберите команду" : "Поменять команду"
    end
    
    def display_team_if_choosen current_user
        if current_user.team.presence
            "<img src='http://upload.wikimedia.org/wikipedia/de/d/da/Manchester_United_FC.svg' width='60px' />" + "<div><i>#{current_user.team}</i></div>"
        end
    end
    
end
