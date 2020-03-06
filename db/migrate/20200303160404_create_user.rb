class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table "users", force: :cascade do |t|
      t.string "name"
      t.string "bio"
      t.integer "age"
      t.string "city"
    end
  end
end
