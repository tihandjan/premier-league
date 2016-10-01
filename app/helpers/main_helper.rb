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
            ["Sunderland AFC", "Сандерл"],
            ["Swansea City FC", "Свонси"],
            ["Crystal Palace FC", "КПЛ"],
            ["Southampton FC", "Саунгемп"],
            ["Watford FC", "Уотфорд"],
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
        if status == 'FINISHED' || status == "IN_PLAY"
            result1.to_s + " - " + result2.to_s
        else
            time
        end
    end
    
    def team_translater team
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
            ["Sunderland AFC", "Сандерл"],
            ["Swansea City FC", "Свонси"],
            ["Crystal Palace FC", "КПЛ"],
            ["Southampton FC", "Саунгемп"],
            ["Watford FC", "Уотфорд"],
            ["Burnley FC", "Бернли"],
            ["Hull City FC", "Хал Сити"],
            ["AFC Bournemouth", "Борнмут"],
            ["Middlesbrough FC", "Мидлсбро"],
            ["Stoke City FC", "Сток Сити"]
        ].each do |team_en_ru| 
            if team_en_ru[0] == team
                return team_en_ru[1]
            else
                'команда_1'
            end
        end
    end
    
    def show_team_icon team
        [
            ["Manchester United FC", "Ман Юн",       "sprite sprite-mu"],
            ["Arsenal FC",           "Арсенал",      "sprite sprite-arsenal"],
            ["Chelsea FC",           "Челси",        "sprite sprite-chelsea"],
            ["Manchester City FC",   "Ман Сити",     "sprite sprite-mc"],
            ["Liverpool FC",         "Ливерпуль",    "sprite sprite-liver"],
            ["Tottenham Hotspur FC", "Тотенхем",     "sprite sprite-totenhem"],
            ["Leicester City FC",    "Лестер",       "sprite sprite-leicester"],
            ["Everton FC",           "Эвертон",      "sprite sprite-everton"],
            ["West Ham United FC",   "Вест Хем",     "sprite sprite-west_ham"],
            ["West Bromwich Albion FC","Вест Бром", "sprite sprite-west_brom"],
            ["Sunderland AFC",       "Сандерл",      "sprite sprite-sunderland"],
            ["Swansea City FC",      "Суонси",       "sprite sprite-swansea"],
            ["Crystal Palace FC",    "КПЛ",          "sprite sprite-crystal"],
            ["Southampton FC",       "Саунгемп",     "sprite sprite-southampton"],
            ["Watford FC",           "Уотфорд",      "sprite sprite-watford"],
            ["Burnley FC",           "Бернли",       "sprite sprite-burnley"],
            ["Hull City FC",         "Хал Сити",     "sprite sprite-hull_city"],
            ["AFC Bournemouth",      "Борнмут",      "sprite sprite-bournem"],
            ["Middlesbrough FC",     "Мидлсбро",     "sprite sprite-midl"],
            ["Stoke City FC",        "Сток Сити",    "sprite sprite-stoke_city"]
        ].each do |team_en_ru| 
            if team_en_ru[0] == team
                return team_en_ru[2]
            else
                "sprite sprite-stoke_city"
            end
        end
    end
    
end
