class CreateLineup < ActiveRecord::Migration[5.2]
  def change
    create_table "lineups", force: :cascade do |t|
      t.text "title"
      t.integer "user_id"
    end
  end
end
