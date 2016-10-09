FactoryGirl.define do
  factory :match do
    home_team "MyString"
    away_team "MyString"
    date "MyString"
    status "MyString"
    self_fixtures "MyString"
    matchday 1
    goals_home_team 1
    goals_away_team 1
    home_win_odds 1
    draw_odds 1
    away_win_odds 1
  end
end
