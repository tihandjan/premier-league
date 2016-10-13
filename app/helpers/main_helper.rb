module MainHelper
    
    def select_team
        [
            ["Manchester United FC", "Манчестер Юнайтед"],
            ["Arsenal FC", "Арсенал"],
            ["Chelsea FC", "Челси"],
            ["Manchester City FC", "Манчестер Сити"],
            ["Liverpool FC", "Ливерпуль"],
            ["Tottenham Hotspur FC", "Тоттенхем"],
            ["Leicester City FC", "Лестер"],
            ["Everton FC", "Эвертон"],
            ["West Ham United FC", "Вест Хем"],
            ["West Bromwich Albion FC", "Вест Бромвич"],
            ["Sunderland AFC", "Сандерленд"],
            ["Swansea City FC", "Суонси"],
            ["Crystal Palace FC", "КПЛ"],
            ["Southampton FC", "Саунгемптон"],
            ["Watford FC", "Уотфорд"],
            ["Burnley FC", "Бернли"],
            ["Hull City FC", "Хал Сити"],
            ["AFC Bournemouth", "Борнмут"],
            ["Middlesbrough FC", "Миддлсбро"],
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
            ["Tottenham Hotspur FC", "Тоттенх"],
            ["Leicester City FC", "Лестер"],
            ["Everton FC", "Эвертон"],
            ["West Ham United FC", "Вест Хем"],
            ["West Bromwich Albion FC", "Вест Бром"],
            ["Sunderland AFC", "Сандерл"],
            ["Swansea City FC", "Суонси"],
            ["Crystal Palace FC", "КПЛ"],
            ["Southampton FC", "Саунгемп"],
            ["Watford FC", "Уотфорд"],
            ["Burnley FC", "Бернли"],
            ["Hull City FC", "Хал Сити"],
            ["AFC Bournemouth", "Борнмут"],
            ["Middlesbrough FC", "Мидлсбро"],
            ["Stoke City FC", "Сток Сити"],
            
            ["FC Bayern München", "Бавария"],
            ["Werder Bremen", "Вердер"],
            ["FC Augsburg", "Аугсбург"],
            ["VfL Wolfsburg", "Вольфсбурга"],
            ["Borussia Dortmund", "Боруссия Д"],
            ["1. FSV Mainz 05", "Майнц"],
            ["Eintracht Frankfurt", "Айнтрахт"],
            ["FC Schalke 04", "Шальке 04"],
            ["Hamburger SV", "Гамбург"],
            ["FC Ingolstadt 04", "Ингольштадт"],
            ["1. FC Köln", "Кельн"],
            ["SV Darmstadt 98", "Дармштадт"],
            ["Bor. Mönchengladbach", "Боруссия М"],
            ["Bayer Leverkusen", "Байер"],
            ["Hertha BSC", "Герта"],
            ["SC Freiburg", "Фрайбург"],
            ["TSG 1899 Hoffenheim", "Хоффенхайм"],
            ["Red Bull Leipzig", "Лейпциг"],

            ["AS Roma", "Рома"],
            ["Udinese Calcio", "Удинезе"],
            ["Juventus Turin", "Ювентус"],
            ["ACF Fiorentina", "Фиорентина"],
            ["AC Milan", "Милан"],
            ["Torino FC", "Торино"],
            ["AC Chievo Verona", "Кьево"],
            ["FC Internazionale Milano", "Интер"],
            ["Empoli FC", "Эмполи"],
            ["UC Sampdoria", "Сампдория"],
            ["Genoa CFC", "Дженоа"],
            ["Cagliari Calcio", "Кальяри"],
            ["Bologna FC", "Болонья"],
            ["FC Crotone", "Кротоне"],
            ["US Cittá di Palermo", "Палермо"],
            ["US Sassuolo Calcio", "Сассуоло"],
            ["Pescara Calcio", "Пескара"],
            ["SSC Napoli", "Наполи"],
            ["Atalanta BC", "Аталанта"],
            ["SS Lazio", "Лацио"],
            
            ["Málaga CF" "Малага",],
            ["CA Osasuna", "Осасуна"],
            ["RC Deportivo La Coruna", "Депортиво К"],
            ["SD Eibar", "Эйбар"],
            ["FC Barcelona", "Барселона"],
            ["Real Betis", "Реал Б"],
            ["Granada CF", "Гранада"],
            ["Villarreal CF", "Вильяреал"],
            ["Sevilla FC", "Севилья"],
            ["RCD Espanyol", "Эспаньол"],
            ["Sporting Gijón", "Спортинг"],
            ["Athletic Club", "Атлетик"],
            ["Real Sociedad de Fútbol", "Реал С"],
            ["Real Madrid CF", "Реал М"],
            ["Club Atlético de Madrid", "Атлетико"],
            ["Deportivo Alavés", "Депортиво А"],
            ["RC Celta de Vigo", "Сельта"],
            ["CD Leganes", "Леганес"],
            ["Valencia CF", "Валенсия"],
            ["UD Las Palmas", "Лас-Пальмас"],

            ["FC Basel", "Базель"],
            ["Ludogorez Rasgrad", "Лудогорец"], 
            ["FC Rostov", "Ростов"],
            ["PSV Eindhoven", "ПСВ"],
            ["Celtic FC", "Селтик"],
            ["Dynamo Kyiv", "Динамо К"],
            ["SL Benfica", "Бенфика"],
            ["Besiktas JK", "Бешикташ"],
            ["Paris Saint-Germain", "ПСЖ"],
            ["Legia Warszawa", "Легия"],
            ["Olympique Lyonnais", "Лион"],
            ["GNK Dinamo Zagreb", "Динамо Загр"],
            ["FC Porto", "Порту"],
            ["FC Copenhagen", "Копенгаген"], 
            ["Club Brugge", "Брюгге"],
            ["Sporting CP", "Спортинг"],
            ["CSKA Moscow", "ЦСКА"],
            ["AS Monaco FC", "Монако"]
      
       ].each do |team_en_ru| 
            if team_en_ru[0] == team
                return team_en_ru[1]
            else
                team
            end
        end
    end
    
    def full_team_translater team
        [
            ["Manchester United FC", "Манчестер Юнайтед"],
            ["Arsenal FC", "Арсенал"],
            ["Chelsea FC", "Челси"],
            ["Manchester City FC", "Манчестер Сити"],
            ["Liverpool FC", "Ливерпуль"],
            ["Tottenham Hotspur FC", "Тоттенхем"],
            ["Leicester City FC", "Лестер"],
            ["Everton FC", "Эвертон"],
            ["West Ham United FC", "Вест Хем"],
            ["West Bromwich Albion FC", "Вест Бромвич"],
            ["Sunderland AFC", "Сандерленд"],
            ["Swansea City FC", "Суонси"],
            ["Crystal Palace FC", "КПЛ"],
            ["Southampton FC", "Саунгемптон"],
            ["Watford FC", "Уотфорд"],
            ["Burnley FC", "Бернли"],
            ["Hull City FC", "Хал Сити"],
            ["AFC Bournemouth", "Борнмут"],
            ["Middlesbrough FC", "Миддлсбро"],
            ["Stoke City FC", "Сток Сити"],
            
            ["FC Bayern München", "Бавария"],
            ["Werder Bremen", "Вердер"],
            ["FC Augsburg", "Аугсбург"],
            ["VfL Wolfsburg", "Вольфсбурга"],
            ["Borussia Dortmund", "Боруссия Д"],
            ["1. FSV Mainz 05", "Майнц"],
            ["Eintracht Frankfurt", "Айнтрахт"],
            ["FC Schalke 04", "Шальке 04"],
            ["Hamburger SV", "Гамбург"],
            ["FC Ingolstadt 04", "Ингольштадт"],
            ["1. FC Köln", "Кельн"],
            ["SV Darmstadt 98", "Дармштадт"],
            ["Bor. Mönchengladbach", "Боруссия М"],
            ["Bayer Leverkusen", "Байер"],
            ["Hertha BSC", "Герта"],
            ["SC Freiburg", "Фрайбург"],
            ["TSG 1899 Hoffenheim", "Хоффенхайм"],
            ["Red Bull Leipzig", "Лейпциг"],

            ["AS Roma", "Рома"],
            ["Udinese Calcio", "Удинезе"],
            ["Juventus Turin", "Ювентус"],
            ["ACF Fiorentina", "Фиорентина"],
            ["AC Milan", "Милан"],
            ["Torino FC", "Торино"],
            ["AC Chievo Verona", "Кьево"],
            ["FC Internazionale Milano", "Интер"],
            ["Empoli FC", "Эмполи"],
            ["UC Sampdoria", "Сампдория"],
            ["Genoa CFC", "Дженоа"],
            ["Cagliari Calcio", "Кальяри"],
            ["Bologna FC", "Болонья"],
            ["FC Crotone", "Кротоне"],
            ["US Cittá di Palermo", "Палермо"],
            ["US Sassuolo Calcio", "Сассуоло"],
            ["Pescara Calcio", "Пескара"],
            ["SSC Napoli", "Наполи"],
            ["Atalanta BC", "Аталанта"],
            ["SS Lazio", "Лацио"],
            
            ["Málaga CF" "Малага",],
            ["CA Osasuna", "Осасуна"],
            ["RC Deportivo La Coruna", "Депортиво К"],
            ["SD Eibar", "Эйбар"],
            ["FC Barcelona", "Барселона"],
            ["Real Betis", "Реал Б"],
            ["Granada CF", "Гранада"],
            ["Villarreal CF", "Вильяреал"],
            ["Sevilla FC", "Севилья"],
            ["RCD Espanyol", "Эспаньол"],
            ["Sporting Gijón", "Спортинг"],
            ["Athletic Club", "Атлетик"],
            ["Real Sociedad de Fútbol", "Реал С"],
            ["Real Madrid CF", "Реал М"],
            ["Club Atlético de Madrid", "Атлетико"],
            ["Deportivo Alavés", "Депортиво А"],
            ["RC Celta de Vigo", "Сельта"],
            ["CD Leganes", "Леганес"],
            ["Valencia CF", "Валенсия"],
            ["UD Las Palmas", "Лас-Пальмас"],

            ["FC Basel", "Базель"],
            ["Ludogorez Rasgrad", "Лудогорец"], 
            ["FC Rostov", "Ростов"],
            ["PSV Eindhoven", "ПСВ"],
            ["Celtic FC", "Селтик"],
            ["Dynamo Kyiv", "Динамо К"],
            ["SL Benfica", "Бенфика"],
            ["Besiktas JK", "Бешикташ"],
            ["Paris Saint-Germain", "ПСЖ"],
            ["Legia Warszawa", "Легия"],
            ["Olympique Lyonnais", "Лион"],
            ["GNK Dinamo Zagreb", "Динамо Загр"],
            ["FC Porto", "Порту"],
            ["FC Copenhagen", "Копенгаген"], 
            ["Club Brugge", "Брюгге"],
            ["Sporting CP", "Спортинг"],
            ["CSKA Moscow", "ЦСКА"],
            ["AS Monaco FC", "Монако"]
        ].each do |team_en_ru| 
            if team_en_ru[0] == team
                return team_en_ru[1]
            else
                team
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
            ["Tottenham Hotspur FC", "Тоттенх",     "sprite sprite-totenhem"],
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
            ["Stoke City FC",        "Сток Сити",    "sprite sprite-stoke_city"],
            
            ["FC Bayern München", "Бавария",         "sprite sprite-Bavaria"],
            ["Werder Bremen", "Вердер",              "sprite sprite-werder"],
            ["FC Augsburg", "Аугсбург",              "sprite sprite-Auzburg"],
            ["VfL Wolfsburg", "Вольфсбурга",         "sprite sprite-wolsburg"],
            ["Borussia Dortmund", "Боруссия Д",      "sprite sprite-Borussia_D"],
            ["1. FSV Mainz 05", "Майнц",             "sprite sprite-Mainz"],
            ["Eintracht Frankfurt", "Айнтрахт",      "sprite sprite-Aintraht"],
            ["FC Schalke 04", "Шальке 04",           "sprite sprite-shalke_04"],
            ["Hamburger SV", "Гамбург",              "sprite sprite-hamburg"],
            ["FC Ingolstadt 04", "Ингольштадт",      "sprite sprite-ingolstad"],
            ["1. FC Köln", "Кельн",                  "sprite sprite-Keln"],
            ["SV Darmstadt 98", "Дармштадт",         "sprite sprite-darmshtad"],
            ["Bor. Mönchengladbach", "Боруссия М",   "sprite sprite-Borussia_M"],
            ["Bayer Leverkusen", "Байер",            "sprite sprite-Bayer"],
            ["Hertha BSC", "Герта",                  "sprite sprite-Gerta"],
            ["SC Freiburg", "Фрайбург",              "sprite sprite-Fraiburg"],
            ["TSG 1899 Hoffenheim", "Хоффенхайм",    "sprite sprite-Hoffenhain"],
            ["Red Bull Leipzig", "Лейпциг",          "sprite sprite-Leipzig"],

            ["AS Roma", "Рома",                      "sprite sprite-roma"],
            ["Udinese Calcio",                       "Удинезе", "sprite sprite-udineze"],
            ["Juventus Turin", "Ювентус",            "sprite sprite-juventus"],
            ["ACF Fiorentina", "Фиорентина",         "sprite sprite-fiorentina"],
            ["AC Milan", "Милан",                    "sprite sprite-milan"],
            ["Torino FC", "Торино",                  "sprite sprite-torino"],
            ["AC Chievo Verona", "Кьево",            "sprite sprite-chievo"],
            ["FC Internazionale Milano", "Интер",    "sprite sprite-inter"],
            ["Empoli FC", "Эмполи",                  "sprite sprite-empoli"],
            ["UC Sampdoria", "Сампдория",            "sprite sprite-sampdoria"],
            ["Genoa CFC", "Дженоа",                  "sprite sprite-genoa"],
            ["Cagliari Calcio", "Кальяри",           "sprite sprite-cagliari"],
            ["Bologna FC", "Болонья",                "sprite sprite-bologna"],
            ["FC Crotone", "Кротоне",                "sprite sprite-crotone"],
            ["US Cittá di Palermo", "Палермо",       "sprite sprite-palermo"],
            ["US Sassuolo Calcio", "Сассуоло",       "sprite sprite-sassuolo"],
            ["Pescara Calcio", "Пескара",            "sprite sprite-pescara"],
            ["SSC Napoli", "Наполи",                 "sprite sprite-napoli"],
            ["Atalanta BC", "Аталанта",              "sprite sprite-atalanta"],
            ["SS Lazio", "Лацио",                    "sprite sprite-lazio"],
            
            ["Málaga CF" "Малага",                   "sprite sprite-malaga"],
            ["CA Osasuna", "Осасуна",                "sprite sprite-ossasuna"],
            ["RC Deportivo La Coruna", "Депортиво К","sprite sprite-deportivo"],
            ["SD Eibar", "Эйбар",                    "sprite sprite-eibar"],
            ["FC Barcelona", "Барселона",            "sprite sprite-barselona"],
            ["Real Betis", "Реал Б",                 "sprite sprite-real_betis"],
            ["Granada CF", "Гранада",                "sprite sprite-granada"],
            ["Villarreal CF", "Вильяреал",           "sprite sprite-villareal"],
            ["Sevilla FC", "Севилья",                "sprite sprite-sevilla"],
            ["RCD Espanyol", "Эспаньол",             "sprite sprite-espaniol"],
            ["Sporting Gijón", "Спортинг",           "sprite sprite-sporting"],
            ["Athletic Club", "Атлетик",             "sprite sprite-ath_bilbao"],
            ["Real Sociedad de Fútbol", "Реал С",    "sprite sprite-real_sosiedad"],
            ["Real Madrid CF", "Реал М",             "sprite sprite-real_m"],
            ["Club Atlético de Madrid", "Атлетико",  "sprite sprite-atletico"],
            ["Deportivo Alavés", "Депортиво А",      "sprite sprite-alaves"],
            ["RC Celta de Vigo", "Сельта",           "sprite sprite-selta"],
            ["CD Leganes", "Леганес",                "sprite sprite-leganes"],
            ["Valencia CF", "Валенсия",              "sprite sprite-valensia"],
            ["UD Las Palmas", "Лас-Пальмас",         "sprite sprite-las_palmas"],

            ["FC Basel", "Базель",                   "sprite sprite-basel"],
            ["Ludogorez Rasgrad", "Лудогорец",       "sprite sprite-ludogorets"], 
            ["FC Rostov", "Ростов",                  "sprite sprite-rostov"],
            ["PSV Eindhoven", "ПСВ",                 "sprite sprite-psv"],
            ["Celtic FC", "Селтик",                  "sprite sprite-seltic"],
            ["Dynamo Kyiv", "Динамо К",              "sprite sprite-dynamo_k"],
            ["SL Benfica", "Бенфика",                "sprite sprite-benfica"],
            ["Besiktas JK", "Бешикташ",              "sprite sprite-besiktash"],
            ["Paris Saint-Germain", "ПСЖ",           "sprite sprite-psg"],
            ["Legia Warszawa", "Легия",              "sprite sprite-legia"],
            ["Olympique Lyonnais", "Лион",           "sprite sprite-lyon"],
            ["GNK Dinamo Zagreb", "Динамо Загр",     "sprite sprite-dynamo_z"],
            ["FC Porto", "Порту",                    "sprite sprite-porto"],
            ["FC Copenhagen", "Копенгаген",          "sprite sprite-kopengagen"], 
            ["Club Brugge", "Брюгге",                "sprite sprite-brugge"],
            ["Sporting CP", "Спортинг",              "sprite sprite-sporting_l"],
            ["CSKA Moscow", "ЦСКА",                  "sprite sprite-cska"],
            ["AS Monaco FC", "Монако",               "sprite sprite-monaco"]
        ].each do |team_en_ru| 
            if team_en_ru[0] == team
                return team_en_ru[2]
            end
        end
    end
    
    def in_play_or_finished status
        if status == "IN_PLAY"
            '#e90052'
        elsif status == "FINISHED"
            '#243843'
        end
    end
    
    def show_match_day team
        if team['date'].to_time.strftime('%d %b %Y') == (Time.now.to_time).strftime('%d %b %Y')
            team['matchday']
        end
    end
    
    def change_row_color number
        if number % 2 == 0
            'tr_second'
        else
            'tr_first'
        end
    end
    
end
