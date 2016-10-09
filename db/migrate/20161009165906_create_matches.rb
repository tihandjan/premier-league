class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :home_team
      t.string :away_team
      t.string :date
      t.string :status
      t.string :self_fixtures
      t.integer :matchday
      t.integer :goals_home_team
      t.integer :goals_away_team
      t.integer :home_win_odds
      t.integer :draw_odds
      t.integer :away_win_odds

      t.timestamps null: false
    end
  end
end
