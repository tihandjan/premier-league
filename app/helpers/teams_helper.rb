module TeamsHelper

    def translate_league league
        [
            ['apl', 'АПЛ'],
            ['laliga', 'Ла Лига'],
            ['bundesliga', 'Бундеслига'],
            ['seria-a', 'Серия А'],
            ['chempions-league', 'ЛЧ'],
        ].each do |item|
            if item[0] == league
                return item[1]
            end
        end
        return league
    end

end