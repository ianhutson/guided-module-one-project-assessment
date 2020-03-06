##### How to Install/Run the App #####
Welcome to Daily Fantasy NBA's README. 
How to install: 
  1. Go to the github url: and clone the file.
  2. In your terminal type "git clone" followed by the SSH key on github in the desired directory. This
 will create the project folder for the application. The project folder can now be opened. Once
 the folder is open, type "ruby bin/run.rb" in the terminal to start the
 application. 
 *NOTE* If you have any issues you may have to run "bundle install" and/or "rake db:seed".
 
 ##### Menu Options #####
Login - 
Create a username or login with an existing one.

View Profile - 
After logging in, you can view/edit your profile by following the prompts.

Lineups -
Within the Lineups sub-menu, you can view existing lineups, create a new lineup, delete all lineups, or return to the main menu. Viewing lineups will give you the option to view a lineup's players by selecting the lineup's name. Create Lineup will bring you to the lineup creation menu, where you can select position, and then players based on that position input. Once you submit your lineup, the players will be saved. You can also delete ALL lineups from this sub-menu.

 ##### Future Development Plans #####
 1. Connect to a paid API featuring updated matchups and data in real time.
 2. Make lineups 9 players rather than 5 (PG1, PG2, SG1, SG2, SF1, SF2, PF1, PF2, C) with no more than 4 players allowed per NBA team.
 3. Assign budgets to lineups. Lineup players' price total should not exceed the budget of $60,000.
 4. Create a "Build Perfect Lineup" function that studies player/team trends, injuries, matchups, and other data to create the "perfect" lineup.