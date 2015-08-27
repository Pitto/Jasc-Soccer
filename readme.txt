    Copyright (C) 2015 by  Pitto

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


Acknowledgements:
· The FreeBasic Developers
· The Fbgfx developers
· Lachie Dazdarian - for his tutorials about creating a game in FB
· I3I2UI/I0 for his very useful code tips and cleanup
· The FBIde Developers
· All those contibuted to the FreeBasic Manual
· Ebben Feagan and Richard Clark for their useful book "A Beginner’s Guide to FreeBasic"
· All the followers of the http://www.freebasic.net/forum/viewtopic.php?f=15&t=20637 thread, thank you for your feedbacks
· The creators of http://hyperphysics.phy-astr.gsu.edu/hbase/traj.html#tra13, very useful for the ball trajectory calc
· Original font printing routine was created by Chis Chadwick and it came as a part of his Pixel Plus 256 package. Additional code (font loading subs, font formats, font files, changes, …) by Dean Janjic.
· Some fonts used are based on GNU Unifont - Project page http://unifoundry.com/unifont.html
· YSOCCER DEVELOPERS: The stadim bitmap is inspired to their sprites - http://ysoccer.sourceforge.net/
· Sensible Soccer's developers - They made a beautiful game

'TODO LIST -------------------------------------
· matchtime and half-time field switch
    fix check_throw_in_corner_kick()
· IMPROVE AI (sooo much!)
· A better menu
· AFTERTOUCH Wow! :)
· Human vs Human
· cleanup code (heavy work!) :(
· delay of the players and of the match events
  based not on the program cycles but using the timing
· commenting code better
· get_short_side_pl_to_pass
· get_short_endline_pl_to_pass
· New sprite set
· 3 kind of skin for the player
· Replais
· change other #define with consts
· Sound effects
· Players have to go outside the penalty area when there are some freekicks
· direction of the player going to the ball has to be corrected
· LESS Global variables!
· Too much spaghetti code! Clean-up code & design!!!
· change ball bound limits
· When player is near the ball the code could help him to get
  the correct angle to the ball

DEV LOG -------------------------------------
0.24.9
· Fixed a bug in team kit painting
· Stadium bitmaps - freely inspired to Ysoccer stadium
· Pre-match teams presentation
· Added a custom bitmap font (CoolFont)
· Added cameraman sprites
· Added bench bitmap
· Improved Goalkeeper AI
· Changed sliding decision policy
· Code cleanup

0.24.8
· It is possible to change on the fly the tactic
  of the team 0 - Press "T" key to activate menu and +/- keys to change
· It is possible to change on the fly formation
  of the team 0 - Press "F" key to activate menu and +/- keys to change
· Initial position of the players
· Gameplay on Youtube!

0.24.7
· It is possibile to control the Debug level
· Timing on/off when game is inactive
· Half Time switch field - to be improved

0.24.5
· Tactic editor merged into the main program
· a dedicated sub routine to draw pitch lines
· improved options available on debug mode 
· Little fix ond delta timing, now the game works fine also under Linux
  this fix has to be improved
· minor changes on menu - now after the match the game doesn't ends but
· enhanced menu navigation

0.24
· may be compiled with the new Freebasic compiler's release (1.00)
· Released under GNU GPL license 2.0
· Repository available from GitHub
· ball can hit net wood
· code cleanup
· added is_goal() function
· added record_ball_position() function
· added SUB update_ball_on_goal()
· custom font - important! only ASCII charset in range 0-127
· enhanced Debug messages display
· Key "R" in debug mode reverses the attack direction of the teams
· changed on Find_shoot_angle() Function
· changed on get_ball_tile() Function
· changed SUB check_ball_goals() SUB

0.23.5
· minor changes on update_ball SUB
· minor changes on is_pl_input_rds FUNCTION
· minor changes on get_user_input_action SUB
· generic code cleanup
· changed get_PL_input_rds() 
· early joystick support

0.23
· aftertouch

0.22.5
· Main menu more user friendly
· Fixed a bug in load_behaviour SUB - Thanks to nobozoz
· Fixed a bug in get_ball_tile FUNCTION - Thanks to nobozoz
· added init_gfx SUB
· added dbg_display_tct_file_check SUB
· added display_menu SUB
· added init_timing() SUB
· minor changes in paint_kits SUB
· major changes in draw_aknowledgements SUB
· added Ball.spin
· added aftertouch - see get_user_spin()
· changed Get_ball_tile SUB
· minor changes on update_ball SUB
· generic code cleanup

0.22
· New Tactic management (256 position for the player instead of 36)
· New Tactic data (10 different tactic avalaible) the data are stored into text files with ".tac" extension
· Added some Pitch feature (Soft, Wet, Muddy, etc…)
· Added mins of game selection (3, 5, 7, 10)
· Teams & Players stored into a .txt file
· Player with features (speed, stamina, etc…)… they maybe loaded and stored also if arent'all yet used
· changhed Update_Main_Menu() SUB
· changhed Draw_Main_Menu() SUB
· changhed Run_tactic() SUB
· changhed find_shoot_angle() FUNCTION
· changhed Load_tactic() SUB
· changhed start_frame() FUNCTION now it reads the data from a text file "bhv.dat"
· changhed Load_beahviour() SUB now it reads the data from a text file "bhv.dat"
· added print_pl_action() FUNCTION - useful for debug
· added Load_Teams_List() SUB
· added load_pitch_data() SUB reads the pitch data from the text file "pitch.dat"
· added get_nrst_pl_ball_free_kick() FUNCTION returns the right freekicker
· added other pitch sprites
· added wallpaper bitmaps from mine handpainted subbuteo collection
· deleted Get_tact_tile function
· deleted get_rds_from_tile function
· generic code cleanup
· changed start_frame function
· deleted A_b_t_p function, used a marco vith atan2 function instead to compute the angle between two points
· deleted SUB get_user_input_ways

0.21.5
· minor change on update_ball() SUB for a correct ball phisics
· added find_shoot_angle(pl_ID) FUNCTION
· added draw_pitch_lines() SUB
· added shoot_ball SUB
· added is_pl_input_rds() FUNCTION
· added get_pl_input_rds() FUNCTION
· changed is_in_pl_fieldview() FUNCTION
· changed reset_gk_net_position SUB
· more FPS on slower PC's 
· Beta Delta Timing
· minor changes on get_passing_ball_speed FUNCTION
· generic code cleanup
· changhed Update_Match_Event SUB
· changhed Update_Player SUB SUB
· changed get_user_input_action SUB

0.21
· minor changes on update_match_event() SUB
· less code for the draw_players() SUB
· the Goalkeeper can catch the ball
· minor changes on update_players() SUB
· added check_throw_in_corner_kick() SUB
· code cleanup
· Z sorting of the ball (see draw_players() SUB for details)
· better throw in routine
· Gk smarter on corner kicks and throw in
· added is_ball_into_opponent_penalty_area() FUNCTION
· added is_pl_into_opponent_penalty_area () FUNCTION
  in debug mode

0.20.5
· works with the new Freebasic compiler's release (0.90.1)
· changed check_ball_border... in check_ball_goals SUB
· added update_match_events SUB <- IMPORTANT ADD
· minor changes on get_ball_tile function
· added move_player SUB
· added move_all_players SUB
· added run_tactic_all_players SUB
· added check_Ball_goals SUB
· added check_Ball_limits SUB
· added restore_player_speed SUB
· added reset_gk_net_position SUB
· minor changes on draw_pitch() SUB
· minor changes on get_pl_behavior()SUB
· less sprites for the falling animation
· fouls, throw in, corner kicks

0.20
· added main menu (update_main_menu and draw_main_menu SUBS)
· added get_pl_to_pass FUNCTION - useful to the human player to perform a precise passage
· changed the is_ball_controllable_by_human FUNCTION
· changed the get_user_input_action SUB
· added training mode & training mode with debug
· minor changes on gk smart
· some code cleanup
· usage of enums for match_events and pl_action
· SUBS have been alphabetically ordered
· minor changes on get_user_input_ways SUB - usage of consts for pl(c).rds
· match may be paused pressing "P" key (but the timing is not stopped yet)
· on screen debug may be activated/deactivated pressing "D" key
· changed get_passing_ball_speed FUNCTION

0.19.5
· only one key for kicking, passing, heading & tackling - at this moment the control key (see get_user_input_action SUB for details)
· changed the get_user_input_action SUB
· changed the get_user_input_ways SUB
· Vertical visualization instead of the horizontal view.
· minor changes on Gk smart (Him is still very stupid)
· changed get_endline_pl_to_pass SUB - fixed an error, now the SUB is simplest
· Redrawed nets
· added is_in_pl_fieldview FUNCTION - useful to check if a pl (human controlled) can pass to another
· the user can choice if watch the match or play the match… or exit
· Timer on match - no more than 3 mins of gameplay

0.19
· changed get_passing_ball_speed function
· minor changes on Gk smart
· changed get_user_input sub
· added human control for team 0 - cursor keys and keys Q to crossing / sliding, W to pass, E to kick / headkick
· added is_slidable FUNCTION - useful to check if the selected player can perform a slide
· added is_headkickable FUNCTION - useful to check if the selected player can perform a headkick
· added run_tactic SUB
· added get_user_input_action SUB
· added get_user_input_ways SUB
· added is_ball_controllable_by_human FUNCTION - useful to check if the selected human player can play the ball
· only the Esc key allow to exit from the program
· added show_intro SUB
· new const _2PI8 - is the double of PI
· custom kit for the goalkeeper
· press Z key to show debug values
· another colored ring under the pl_ball_owner_id player

0.18.5
· Massive use of consts instead of #define
· Integer Variable Type instead
  of Byte, Ubyte, Uinteger
· The player who is performing an headkick may also fall after
· Sprites for the Goalkeeper
· Goalkeeping status
· added Check_bitmap SUB to check if the sprites have been rightly loaded (it is commented so you don't have to compile it)
· Also the socks of the player may be painted with a customized color (see Paint_kit SUB)
· Goalkeeper has a little better smart (also if is still very stupid)… him doesn't jump if his team is the ball owner
· Changed the get_endline_pl_to_pass SUB
· Sqr(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2))) instead of sqr(((x1-x2)^2)+((y1-y2)^2)) for a faster computing (thanks again to I3I2UI/I0)
· draw_aknowledgements() SUB

0.18
· Try to try to catch the ball with SLIDING only if the pl slider is not receiving the ball and if the ball distance is into a specified min max range
· Goalkeeper area lines (thanks to I3I2UI/I0)
· changed load_bitmap SUB
· changed update_player SUB
· Now JASC needs only one pl_sprite bitmap
· created Paint_kit SUB   useful to fill the team kits with a custom color
· Headkicks sprites
· Headkicking status for the player

0.17.5
· added sliding sprites
· added sliding status for the players
· modified check_pl_collisions sub
· modified update_players sub
· added delete_bitmap sub · changed some Gk smarts
· game may be righlty closed  by clicking on the X button of the window

0.17
· added is_on_camera_crop sub to spend less CPU time for drawing sprites
· added pl.action & pl.active to the player_proto type (useful to perform fallings, slides etc…)
· new sprites  for the pitch, the players and the nets
· fixed get_tact_tile sub
· better tactic - based upon 442 module
· collision check between players who are on camera crop

0.16
· The FIRST public release

0.06
· clean up code
· Function get_2nd_pl_to_pass
