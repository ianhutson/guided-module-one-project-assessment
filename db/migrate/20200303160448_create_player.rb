class CreatePlayer < ActiveRecord::Migration[5.2]
  def change
    create_table "players", force: :cascade do |t|
      t.string "firstname" 
      t.string "lastname"
      t.string "position"
      t.string "team"
      t.integer "price"
      t.integer "fdpperg"
    end
  end
end
