Player.delete_all
User.delete_all
LineupPlayer.delete_all

ian = User.create(name: "ian", bio: "yo", city: "atl", age: 28)

lineup = Lineup.create(title: "hi", user_id: 13)

player_data = JSON.parse(File.read("/Users/ian/Documents/code/guided-module-one-project-assessment/player.json"))
player_data.each do |t|
  Player.create(firstname: t["firstname"], lastname: t["lastname"], position: t["position"], price: t["price"], team: t["team"], fdpperg: t["fdpperg"])
end
