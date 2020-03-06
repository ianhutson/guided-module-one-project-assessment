class LineupPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table "lineup_players", force: :cascade do |t|
      t.integer "lineup_id"
      t.integer "player_id"
    end
  end
end
