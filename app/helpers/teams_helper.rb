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

    def player_position player, pos
        if (["Keeper"].include? player.position) && (pos == 'вратари')
            true
        elsif (["Central Midfield", "Left Midfield", "Midfield", "Mittelfeld", "Right Midfield"].include? player.position) && (pos == 'полузащита')
            true
        elsif (["Centre Back", "Right-Back", "Left-Back", "Defensive Midfield"].include? player.position) && (pos == 'защита')
            true
        elsif (["Secondary Striker", "Attacking Midfield", "Centre Forward", "Left Wing", "Right Wing",].include? player.position) && (pos == 'нападение')
            true
        end
    end

    def age(birth)
        today = Date.today
        age = today.year - birth.year
        age -= 1 if birth.strftime("%m%d").to_i > today.strftime("%m%d").to_i
        age
    end

    def pass_object obj, name
        obj.find_by(name: name)
    end

end