def run
  login
  main_menu
end

def login
  puts "Welcome to Daily Fantasy NBA!"
  puts ""
  puts "Please enter your username."
  input = gets.chomp
  $user = User.find_by(name: input)

  if $user
    puts "Welcome #{$user["name"]}, it's good to see you again!"
  else
    $user = User.create(name: input)
    puts "Created a new account with username '#{$user.name}''"
    puts "Welcome #{$user.name}!"
  end
end

def profile_menu
  puts "View Profile - "
  puts "1. Bio"
  puts "2. Age"
  puts "3. City"
  puts "4. Main Menu"
  input = gets.chomp
  if input == "1"
    puts "Bio:"
    puts "#{$user[:bio]}"
    puts "1. Edit Bio"
    puts "2. Back"
    if gets.chomp == "1"
      puts "Write a short description of yourself!"
      $user.bio = gets
      $user.save
      puts "Bio updated!"
      puts "#{$user[:bio]}"
      profile_menu
    else
      profile_menu
    end
  elsif input == "2"
    puts "Current age: #{$user["age"]}"
    puts "1. Edit Age"
    puts "2. Back"
    if gets.chomp == "1"
      puts "Please enter your age as a number (example: 25, 18, 47)"
      $user.age = gets
      $user.save
      puts "Age updated! #{$user.name} is #{$user["age"]} years old!"
      profile_menu
    else
      profile_menu
    end
  elsif input == "3"
    puts "Current City: #{$user["city"]}"
    puts "1. Edit City"
    puts "2. Back"
    input = gets.chomp
    if input == "1"
      puts "Please enter your city or location."
      $user.city = gets
      $user.save
      puts "City updated! #{$user.name} lives in #{$user["city"]}."
      profile_menu
    else
      profile_menu
    end
  else
    main_menu
  end
end

def main_menu
  puts "Main Menu:"
  puts "1. View Profile"
  puts "2. Lineups"
  puts "3. Exit"
  input = gets.chomp
  if input == "1"
    profile_menu
  elsif input == "2"
    lineup_menu
  elsif input == "3"
    exit
  else
    main_menu
  end
end

def lineup_creation
  prompt = TTY::Prompt.new
  lineup_arr = []
  choice = prompt.select("Select position to fill:") do |menu|
    menu.default 1
    menu.choice "PG", 1
    menu.choice "SG", 2
    menu.choice "SF", 3
    menu.choice "PF", 4
    menu.choice "C", 5
    menu.choice "Submit Lineup", 6
    menu.choice "Main Menu", 7
  end

  if choice == 1
    puts "*** Point Guard ***"
    pg = Player.where(position: "PG")
    pg_arr = pg.map do |player|
      "#{player["firstname"]} #{player["lastname"]} | #{player["position"]} | #{player["team"]} | $#{player["price"]} | Fantasy Points Per Game: #{player["fdpperg"]}"
    end
    $pg_selection = prompt.select("Select your Point Guard:", pg_arr)
    lineup_arr << $pg_selection
    puts "Players in current lineup:"
    puts "PG | #{$pg_selection}"
    puts "SG | #{$sg_selection}"
    puts "SF | #{$sf_selection}"
    puts "PF | #{$pf_selection}"
    puts "C | #{$c_selection}"
    lineup_creation
  elsif choice == 2
    puts "*** Shooting Guard ***"
    sg = Player.where(position: "SG")
    sg_arr = sg.map do |player|
      "#{player["firstname"]} #{player["lastname"]} | #{player["position"]} | #{player["team"]} | $#{player["price"]} | Fantasy Points Per Game: #{player["fdpperg"]}"
    end
    $sg_selection = prompt.select("Select your Shooting Guard:", sg_arr)
    lineup_arr << $sg_selection
    puts "Players in current lineup:"
    puts "PG | #{$pg_selection}"
    puts "SG | #{$sg_selection}"
    puts "SF | #{$sf_selection}"
    puts "PF | #{$pf_selection}"
    puts "C | #{$c_selection}"
    lineup_creation
  elsif choice == 3
    puts "*** Small Forward ***"
    sf = Player.where(position: "SF")
    sf_arr = sf.map do |player|
      "#{player["firstname"]} #{player["lastname"]} | #{player["position"]} | #{player["team"]} | $#{player["price"]} | Fantasy Points Per Game: #{player["fdpperg"]}"
    end
    $sf_selection = prompt.select("Select your Small Forward:", sf_arr)
    lineup_arr << $sf_selection
    puts "Players in current lineup:"
    puts "PG | #{$pg_selection}"
    puts "SG | #{$sg_selection}"
    puts "SF | #{$sf_selection}"
    puts "PF | #{$pf_selection}"
    puts "C | #{$c_selection}"
    lineup_creation
  elsif choice == 4
    puts "*** Power Forward ***"
    pf = Player.where(position: "PF")
    pf_arr = pf.map do |player|
      "#{player["firstname"]} #{player["lastname"]} | #{player["position"]} | #{player["team"]} | $#{player["price"]} | Fantasy Points Per Game: #{player["fdpperg"]}"
    end
    $pf_selection = prompt.select("Select your Power Forward:", pf_arr)
    lineup_arr << $pf_selection
    puts "Players in current lineup:"
    puts "PG | #{$pg_selection}"
    puts "SG | #{$sg_selection}"
    puts "SF | #{$sf_selection}"
    puts "PF | #{$pf_selection}"
    puts "C | #{$c_selection}"
    lineup_creation
  elsif choice == 5
    puts "*** Center ***"
    c = Player.where(position: "C")
    c_arr = c.map do |player|
      "#{player["firstname"]} #{player["lastname"]} | #{player["position"]} | #{player["team"]} | $#{player["price"]} | Fantasy Points Per Game: #{player["fdpperg"]}"
    end
    $c_selection = prompt.select("Select your Center:", c_arr)
    lineup_arr << $c_selection
    puts "Players in current lineup:"
    puts "PG | #{$pg_selection}"
    puts "SG | #{$sg_selection}"
    puts "SF | #{$sf_selection}"
    puts "PF | #{$pf_selection}"
    puts "C  | #{$c_selection}"
    lineup_creation
  elsif choice == 6
    puts "Saving lineup..."
    puts "..."
    puts "..."
    puts "..."
    if Player.where(full_name: $pg_selection).split(" |")[0] == ""
      puts "No PG Selected"
    else (LineupPlayer.create(lineup_id: $new_lineup.id, player_id: Player.find_by(first_name: $pg_selection.split(" |")[0].split(" ")[0], last_name: $pg_selection.split(" |")[0].split(" ")[1])).id)     end
    # if Lineup.create(lineup_id: $new_lineup.id, player_id: Player.where(full_name: $sg_selection)) == nil
    #   puts "No SG Selected"
    # else (LineupPlayer.create(lineup_id: $new_lineup.id, player_id: Player.where(full_name: $sg_selection.split(" |")[0])).id)     end
    # if (LineupPlayer.create(lineup_id: $new_lineup.id, player_id: Player.where(full_name: $sf_selection.split(" |")[0])).id) == nil
    #   puts "No SF Selected"
    # else (LineupPlayer.create(lineup_id: $new_lineup.id, player_id: Player.where(full_name: $sf_selection.split(" |")[0])).id)     end
    # if (LineupPlayer.create(lineup_id: $new_lineup.id, player_id: Player.where(full_name: $pf_selection.split(" |")[0])).id) == nil
    #   puts "No PF Selected"
    # else (LineupPlayer.create(lineup_id: $new_lineup.id, player_id: Player.where(full_name: $pf_selection.split(" |")[0])).id)     end
    # if (LineupPlayer.create(lineup_id: $new_lineup.id, player_id: Player.where(full_name: $c_selection.split(" |")[0])).id) == nil
    #   puts "No C Selected"
    # else (LineupPlayer.create(lineup_id: $new_lineup.id, player_id: Player.where(full_name: $c_selection.split(" |")[0])).id)     end
    puts "$$ Lineup submitted. Good luck! $$"
    main_menu
  else
    main_menu
  end
end

def lineup_menu
  puts "1. View Lineups"
  puts "2. Create Lineup"
  puts "3. Delete ALL Lineups"
  puts "4. Main Menu"
  input = gets.chomp
  if input == "1"
    puts "#{$user.name}'s lineups are:"
    if $user.lineups == []
      puts "You have no lineups!"
      puts "1. Create Lineup"
      puts "2. Lineup Menu"
      if gets.chomp == "1"
        puts "Name your lineup: (example: March6, $lineup$, xD69lol420)"
        $new_lineup = Lineup.create(title: gets, user_id: $user.id)
        $new_lineup.save
        lineup_creation
      else
        lineup_menu
      end
    else
      $lineup_arr = []
      count = 1
      lineup_title = $user.lineups.each do |lineup|
        puts "#{count}. #{lineup.title}"
        count += 1
        $lineup_arr << lineup
      end
      puts "Select lineup number to view players in lineup (example: 3, 47)"
      input = gets.chomp.to_i
      $arr_id = $lineup_arr[input - 1].id
      puts "#{$lineup_arr[input - 1].title} players:"
      if (LineupPlayer.find_by(lineup_id: $arr_id)).nil?
        puts "PG |"
      else pg = (Player.find_by(id: (LineupPlayer.find_by(lineup_id: $arr_id)[:player_id]), position: "PG"))
        puts "PG | #{pg[:first_name]} #{pg[:last_name]}"       end
      if (LineupPlayer.find_by(lineup_id: $arr_id)).nil?
        puts "SG |"
      else sg = (Player.find_by(id: (LineupPlayer.find_by(lineup_id: $arr_id)[:player_id]), position: "SG"))
        puts "SG | #{sg[:first_name]} #{sg[:last_name]}"       end
      if (LineupPlayer.find_by(lineup_id: $arr_id)).nil?
        puts "SF|"
      else sf = (Player.find_by(id: (LineupPlayer.find_by(lineup_id: $arr_id)[:player_id]), position: "SF"))
        puts "SF | #{sf[:first_name]} #{sf[:last_name]}"       end
      if (LineupPlayer.find_by(lineup_id: $arr_id)).nil?
        puts "PF |"
      else pf = (Player.find_by(id: (LineupPlayer.find_by(lineup_id: $arr_id)[:player_id]), position: "PF"))
        puts "PF | #{pf[:first_name]} #{pf[:last_name]}"       end
      if (LineupPlayer.find_by(lineup_id: $arr_id)).nil?
        puts "C |"
      else c = (Player.find_by(id: (LineupPlayer.find_by(lineup_id: $arr_id)[:player_id]), position: "C"))
        puts "C | #{c[:first_name]} #{c[:last_name]}"       end
      puts "1. Delete Lineup"
      puts "2. Lineup Menu"
      if gets.chomp == "1"
        Lineup.find_by(id: ($lineup_arr[input - 1]).id).delete
        $lineup_arr.delete_at(input - 1)
        puts "Lineup deleted!"
        lineup_menu
      else
        main_menu
      end
    end
  elsif input == "2"
    puts "Name your lineup: (example: March6, $lineup$, xD69lol420)"
    $new_lineup = Lineup.create(title: gets, user_id: $user.id)
    $new_lineup.save
    lineup_creation
  elsif input == "3"
    puts "*** WARNING *** "
    puts "You are about to delete ALL lineups. Proceed?"
    puts "1. Yes"
    puts "2. No"
    if gets.chomp == "1"
      $user.lineups.destroy_all
      main_menu
    else
      lineup_menu
    end
  elsif input == "3"
    lineup_menu
  else
    main_menu
  end
end
