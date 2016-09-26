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
    
end
