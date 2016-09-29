module MainHelper
    
    def select_team
        [
            ["Manchester United FC", "Ман Юн"],
            ["Arsenal FC", "Арсенал"],
            ["Chelsea FC", "Челси"],
            ["Manchester City FC", "Ман Сити"],
            ["Liverpool FC", "Ливерпуль"],
            ["Tottenham Hotspur FC", "Тотенхем"],
            ["Leicester City FC", "Лестер"],
            ["Everton FC", "Эвертон"],
            ["West Ham United FC", "Вест Хем"],
            ["West Bromwich Albion FC", "Вест Бром"],
            ["Sunderland AFC", "Сандерленд"],
            ["Swansea City FC", "Свонси"],
            ["Crystal Palace FC", "КПЛ"],
            ["Southampton FC", "Саунгемптон"],
            ["Watford FC", "Вотфорд"],
            ["Burnley FC", "Бернли"],
            ["Hull City FC", "Хал Сити"],
            ["AFC Bournemouth", "Борнмут"],
            ["Middlesbrough FC", "Мидлсбро"],
            ["Stoke City FC", "Сток Сити"]
        ].map{ |team_en, team_ru| [team_ru, team_en] }
    end
    
    def change_blank current_user
        current_user.team.blank? ? "Выберите команду" : "Поменять команду"
    end
    
    def display_team_if_choosen current_user
        if current_user.team.presence
            "<img src='http://upload.wikimedia.org/wikipedia/de/d/da/Manchester_United_FC.svg' width='60px' />" + "<div><i>#{current_user.team}</i></div>"
        end
    end
    
    def time_or_result status, result1, result2, time
        if status == 'FINISHED'
            result1.to_s + " - " + result2.to_s
        else
            time
        end
    end
    
end
